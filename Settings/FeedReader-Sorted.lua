function Initialize()
   -- SET UPDATE DIVIDER
   SKIN:Bang('!SetOption', SELF:GetName(), 'UpdateDivider', -1)
   -- This script never needs to update on a schedule. It should only
   -- update when it gets a "Refresh" command from WebParser.

   -- CREATE MAIN DATABASE
   Feeds = {}

   -- CREATE TYPE MATCHING PATTERNS AND FORMATTING FUNCTIONS
   DefineTypes()

   -- GET MEASURE NAMES
   local AllMeasureNames = SELF:GetOption('MeasureName', '')
   for MeasureName in AllMeasureNames:gmatch('[^%|]+') do
      table.insert(Feeds, {
         Measure     = SKIN:GetMeasure(MeasureName),
         MeasureName = MeasureName,
         Raw         = nil,
         Type        = nil,
         Title       = nil,
		 CustomTitle = nil,
         Link        = nil,
         Error       = nil
         })
   end
--################################################
   	-- MODULES
	EventFile_Initialize()
	HistoryFile_Initialize()
  --################################################

   -- SET STARTING FEED
   f = f or 1

   -- SET USER INPUT
    UserInput = false
   -- Used to detect when an item has been marked as read.
   
   	-- SET THE AGE OF 'NEW' ITEMS
	 iNewItemMins = tonumber(SKIN:GetVariable('NewItemMinutes'))
	 
	-- SET THE CUSTOM TITLES
	for f = 1,5 do 
		Feeds[f].CustomTitle = SKIN:GetVariable('CustomTitle'..f) or nil
    end
end  -- of Initialise
 
function Update()
   Input()
   return Output()
end

-----------------------------------------------------------------------
-- INPUT

function Input(a)
   local f = a or f
   local Raw = Feeds[f].Measure:GetStringValue()
   if Raw == '' then
      Feeds[f].Error = {
         Description = 'Checking for updates...',
         Title       = 'Loading...',
         Link        = 'http://enigma.kaelri.com/support'
         }
      return false
   elseif (Raw ~= Feeds[f].Raw) or UserInput then Feeds[f].Raw = Raw
		  
      -- DETERMINE FEED FORMAT AND CONTENTS
      local t = IdentifyType(Raw)		  
      if not t then
         Feeds[f].Error = {
            Description = 'Could not identify a valid feed format.',
            Title       = 'Invalid Feed Format',
            Link        = 'http://enigma.kaelri.com/support'
            }
         return false
      else
         Feeds[f].Type = t
      end

      -- MAKE SYNTAX PRETTIER
      local Type = Types[t]

	  -- SET TIME NOW
		timeNow = os.time(os.date('*t'))	
		
      -- GET NEW DATA
      Feeds[f].Title = Raw:match('<title.->(.-)</title>') or 'Untitled'
      Feeds[f].Link  = Raw:match(Type.MatchLink)        or nil
	  Feeds[f].Title = DecodeCharacterReference(Feeds[f].Title)	

	  -- ADD CUSTOM TITLES IF DEFINED
		if Feeds[f].CustomTitle ~= "" then
				Feeds[f].Title = Feeds[f].CustomTitle
		end
	  
      local Items = {} 
      for RawItem in Raw:gmatch(Type.MatchItem) do
         local Item  = {}

------ TRIM THE FEED TITLES FOR RAINMETER FORUMS
		 if Feeds[f].Title == 'Rainmeter Forums' then 
			Item.Title  = RawItem:match('<title.-� (.-)</title>')     or nil
		 else
			Item.Title  = RawItem:match('<title.->(.-)</title>')     or nil
		 end		

			-- MATCH RAW DATA
			Item.Unread = 1		
			Item.Link   = RawItem:match(Type.MatchItemLink)          or nil
			Item.Desc   = RawItem:match(Type.MatchItemDesc)          or nil
			Item.Date   = RawItem:match(Type.MatchItemDate)          or nil
			Item.ID     = RawItem:match(Type.MatchItemID)            or Item.Link or Item.Title or Item.Desc or Item.Date
			Item.New = 0
         -- ADDITIONAL PARSING
         if (not Item.Title) or (Item.Title == '') then
            Item.Title = 'Untitled'
         end
 
         if Item.Desc then
            Item.Desc = Item.Desc:gsub('<.->', '')
            Item.Desc = Item.Desc:gsub('%s%s+', ' ')
         end
         Item.Date, Item.AllDay, Item.RealDate = IdentifyDate(Item.Date, t)
		 Item.New =  (( (timeNow-Item.Date)/60 )  < iNewItemMins) and 1 or 0
         table.insert(Items, Item)
      end
--#################################	  
	-- IDENTIFY DUPLICATES
		for i, OldItem in ipairs(Feeds[f]) do
			for j, NewItem in ipairs(Items) do
				if NewItem.ID == OldItem.ID then
					Feeds[f][i].Match = j
					Items[j].Unread   = OldItem.Unread
					if NewItem.RealDate == 0 then
						Items[j].Date   = OldItem.Date
						Items[j].AllDay = OldItem.AllDay
					end
				end
			end
		end

		-- CLEAR DUPLICATES OR ALL HISTORY
		local KeepOldItems = SELF:GetNumberOption('KeepOldItems', 0)

		if (KeepOldItems == 1) and Type.MergeItems then
			for i = #Feeds[f], 1, -1 do
				if Feeds[f][i].Match then
					table.remove(Feeds[f], i)
				end
			end
		else
			for i = 1, #Feeds[f] do
				table.remove(Feeds[f])
			end
		end

		-- ADD NEW ITEMS
		for i = #Items, 1, -1 do
			if Items[i] then
				table.insert(Feeds[f], 1, Items[i])
			end
		end

--##################################	  
	   -- ADD ITEMS
      -- for i = 1, #Items do
            -- table.insert(Feeds[f], 1, Items[i])
         -- end
  
      -- CHECK NUMBER OF ITEMS
      local MaxItems = SELF:GetNumberOption('MaxItems', nil)
      local MaxItems = (MaxItems > 0) and MaxItems or nil

      if #Feeds[f] == 0 then
         Feeds[f].Error = {
            Description = 'No items found.',
            Title       = Feeds[f]['Title'],
            Link        = Feeds[f]['Link']
         }
         return false
      elseif MaxItems and (#Feeds[f] > MaxItems) then
         for i = #Feeds[f], (MaxItems + 1), -1 do
            table.remove(Feeds[f])
         end
      end

  --################################################
		-- MODULES
		EventFile_Update(f)
		HistoryFile_Update(f)
  --################################################

      -- CLEAR ERRORS FROM PREVIOUS UPDATE
      Feeds[f].Error = nil

      -- RESET USER INPUT
      UserInput = false
   end

   return true
end

-----------------------------------------------------------------------
-- OUTPUT

function Output()
   local Queue = {}

   -- MAKE SYNTAX PRETTIER
   local Feed  = Feeds[f]
   local Type  = Types[Feed.Type]
   local Error = Feed.Error

   -- BUILD QUEUE
   Queue['CurrentFeed']   = f
   Queue['NumberOfItems'] = #Feed

   -- CHECK FOR INPUT ERRORS
   local MinItems  = SELF:GetNumberOption('MinItems', 0)
   local Timestamp = SELF:GetOption('Timestamp', '%I.%M %p on %d %B %Y')

   if Error then
      -- ERROR; QUEUE MESSAGES
      Queue['FeedTitle']   = Error.Title
      Queue['FeedLink']    = Error.Link
      Queue['Item1Title']  = Error.Description
      Queue['Item1Link']   = Error.Link
      Queue['Item1Desc']   = ''
      Queue['Item1Date']   = ''
      Queue['Item1Unread'] = 0
	  Queue['Item1New'] = 0

      for i = 2, MinItems do
         Queue['Item'..i..'Title']   = ''
         Queue['Item'..i..'Link']    = ''
         Queue['Item'..i..'Desc']    = ''
         Queue['Item'..i..'Date']    = ''
         Queue['Item'..i..'Unread']  = 0
		 Queue['Item'..i..'New'] = 0
      end
   else
      -- NO ERROR; QUEUE FEED
      Queue['FeedTitle'] = Feed.Title
      Queue['FeedLink']  = Feed.Link or ''

	  -- SORT FEEDS BY DATE					
	  local SortedFeed = {}
	  for k,v in ipairs( Feed ) do table.insert( SortedFeed, k, v ) end	
	  table.sort(SortedFeed, function(a,b) return a.Date > b.Date end)			

	-- QUEUE ITEMS FOR DISPLAY
		for i = 1, math.max(#SortedFeed, MinItems) do
			local Item = SortedFeed[i] or {}		
			Queue['Item'..i..'Title']   = DecodeCharacterReference(Item.Title)   or ''  
			Queue['Item'..i..'Link']    = Item.Link   or Feed.Link or ''		
			Queue['Item'..i..'New']    = Item.New   or ''
		end
	end
	
   -- SET VARIABLES
   local VariablePrefix = SELF:GetOption('VariablePrefix', '')
   for k, v in pairs(Queue) do
      SKIN:Bang('!SetVariable', VariablePrefix..k, v)
   end
   
   -- FINISH ACTION   
   local FinishAction = SELF:GetOption('FinishAction', '')
   if FinishAction ~= '' then
      SKIN:Bang(FinishAction)
   end

   return Error and Error.Description or 'Finished #'..f..' ('..Feed.MeasureName..'). Name: '..Feed.Title..'. Type: '..Feed.Type..'. Items: '..#Feed..'.'
end -- function Output

-----------------------------------------------------------------------
-- EXTERNAL COMMANDS

function Refresh(a)
   a = a and tonumber(a) or f
   if a == f then
      SKIN:Bang('!UpdateMeasure', SELF:GetName())
   else
      Input(a)
   end
end

function Show(a)
   f = tonumber(a)
   SKIN:Bang('!UpdateMeasure', SELF:GetName())
end

function ShowNext()
   f = (f % #Feeds) + 1
   SKIN:Bang('!UpdateMeasure', SELF:GetName())
end

function ShowPrevious()
   f = (f == 1) and #Feeds or (f - 1)
   SKIN:Bang('!UpdateMeasure', SELF:GetName())
end


-----------------------------------------------------------------------
-- TYPES

function DefineTypes()
   Types = {
      RSS = {
         MatchLink      = '<link.->(.-)</link>',
         MatchItem      = '<item.-</item>',
         MatchItemID    = '<guid.->(.-)</guid>',
         MatchItemLink  = '<link.->(.-)</link>',
         MatchItemDesc  = '<description.->(.-)</description>',
         MatchItemDate  = '<pubDate.->(.-)</pubDate>',
         MatchItemDate2 = '<dc:date>(.-)</dc:date>',
         MergeItems     = true,
         ParseDate      = function(s)
            local Date = {}
            local MatchTime = '%a+, (%d+) (%a+) (%d+) (%d+)%:(%d+)%:(%d+) (.-)$'
            local MatchDate = '%a+, (%d+) (%a+) (%d+)$'
            if s:match(MatchTime) then
               Date.day, Date.month, Date.year, Date.hour, Date.min, Date.sec, Date.Offset = s:match(MatchTime)
            elseif s:match(MatchDate) then
               Date.day, Date.month, Date.year = s:match(MatchDate)
            end
            return (Date.year and Date.month and Date.day) and Date or nil
         end
         },
      Atom = {
         MatchLink     = '<link.-href=["\'](.-)["\']',
         MatchItem     = '<entry.-</entry>',
         MatchItemID   = '<id.->(.-)</id>',
         MatchItemLink = '<link.-href=["\'](.-)["\']',
         MatchItemDesc = '<summary.->(.-)</summary>',
         MatchItemDate = '<updated.->(.-)</updated>',
         MergeItems    = true,
         ParseDate     = function(s)
            local Date = {}		
			local MatchTime ='(%d+)%-(%d+)%-(%d+)T(%d+)%:(%d+)%:(%d+%.?%d*)(.-)$'	
            local MatchDate = '(%d+)%-(%d+)%-(%d+)$'
            if s:match(MatchTime) then
               Date.year, Date.month, Date.day, Date.hour, Date.min, Date.sec, Date.Offset = s:match(MatchTime)
            elseif s:match(MatchDate) then
               Date.year, Date.month, Date.day = s:match(MatchDate)
            end
            return Date
         end
         },
      GoogleCalendar = {
         MatchLink     = '<link.-rel=.-alternate.-href=["\'](.-)["\']',
         MatchItem     = '<entry.-</entry>',
         MatchItemID   = '<id.->(.-)</id>',
         MatchItemLink = '<link.-href=["\'](.-)["\']',
         MatchItemDesc = '<summary.->(.-)</summary>',
         MatchItemDate = 'startTime=["\'](.-)["\']',
         MergeItems    = false,
         ParseDate     = function(s)
            local Date = {}
            local MatchTime = '(%d+)%-(%d+)%-(%d+)T(%d+)%:(%d+)%:(%d+)%.%d+(.-)$'
            local MatchDate = '(%d+)%-(%d+)%-(%d+)$'
            if s:match(MatchTime) then
               Date.year, Date.month, Date.day, Date.hour, Date.min, Date.sec, Date.Offset = s:match(MatchTime)
            elseif s:match(MatchDate) then
               Date.year, Date.month, Date.day = s:match(MatchDate)
            end
            return Date
         end
         },
      RememberTheMilk = {
         MatchLink     = '<link.-rel=.-alternate.-href=["\'](.-)["\']',
         MatchItem     = '<entry.-</entry>',
         MatchItemID   = '<id.->(.-)</id>',
         MatchItemLink = '<link.-href=["\'](.-)["\']',
         MatchItemDesc = '<summary.->(.-)</summary>',
         MatchItemDate = '<span class=["\']rtm_due_value["\']>(.-)</span>',
         MergeItems    = false,
         ParseDate     = function(s)
            local Date = {}
            local MatchTime = '%a+ (%d+) (%a+) (%d+) at (%d+)%:(%d+)(%a+)' -- e.g. 'Wed 7 Nov 12 at 3:17PM'
            local MatchDate = '%a+ (%d+) (%a+) (%d+)' -- e.g. 'Tue 25 Dec 12'
            if s:match(MatchTime) then
               Date.day, Date.month, Date.year, Date.hour, Date.min, Date.Meridiem = s:match(MatchTime)
            elseif s:match(MatchDate) then
               Date.day, Date.month, Date.year = s:match(MatchDate)
            end
            return Date
         end
         }
      }
end

-------------------------

function IdentifyType(s)
   -- COLLAPSE CONTAINER TAGS
   for _, v in ipairs{ 'item', 'entry' } do
      s = s:gsub('<'..v..'.->.+</'..v..'>', '<'..v..'></'..v..'>') -- e.g. '<entry.->.+</entry>' --> '<entry></entry>'
   end

   --DEFINE RSS MARKER TESTS
   --Each of these test functions will be run in turn, until one of them gets a solid match on the format type.
   local TestRSS = {
      function(a)
         -- If the feed contains these tags outside of <item> or <entry>, RSS is confirmed.
         for _, v in ipairs{ '<rss', '<channel', '<lastBuildDate', '<pubDate', '<ttl', '<description' } do
            if a:match(v) then
               return 'RSS'
            end
         end
         return false
      end,

      function(a)
         -- Alternatively, if the feed contains these tags outside of <item> or <entry>, Atom is confirmed.
         for _, v in ipairs{ '<feed', '<subtitle' } do
            if a:match(v) then
               return 'Atom'
            end
         end
         return false
      end,

      function(a)
         -- If no markers are present, we search for <item> or <entry> tags to confirm the type.
         local HaveItems   = a:match('<item')
         local HaveEntries = a:match('<entry')

         if HaveItems and not HaveEntries then
            return 'RSS'
         elseif HaveEntries and not HaveItems then
            return 'Atom'
         else
            -- If both kinds of tags are present, and no markers are given, then I give up
            -- because your feed is ridiculous. And if neither tag is present, then no type
            -- can be confirmed (and there would be no usable data anyway).
            return false
         end
      end
      }

   -- RUN RSS MARKER TESTS
   local Class = false
   for _, v in ipairs(TestRSS) do
      Class = v(s)
      if Class then break end
   end

   -- DETECT SUBTYPE AND RETURN
   if Class == 'RSS' then
      return 'RSS'
   elseif Class == 'Atom' then
      if s:match('xmlns:gCal') then
         return 'GoogleCalendar'
      elseif s:match('<subtitle>rememberthemilk.com</subtitle>') then
         return 'RememberTheMilk'
      else
         return 'Atom'
      end
   else
      return false
   end
end

-------------------------

function IdentifyDate(s, t)
   -- PARSE STRING BY TYPE
   local Date
   if s then
      Date = Types[t].ParseDate(s) or Types.RSS.ParseDate(s) or Types.Atom.ParseDate(s) or {}
   else
      Date = {}
   end
   Date.year   = tonumber(Date.year)  or nil
   Date.month  = tonumber(Date.month) or MonthAcronyms[Date.month] or nil
   Date.day    = tonumber(Date.day)   or nil
   Date.hour   = tonumber(Date.hour)  or nil
   Date.min    = tonumber(Date.min)   or nil
   Date.sec    = tonumber(Date.sec)   or  0
   
   -- FIND ENOUGH ELEMENTS, OR DEFAULT TO RETRIEVAL DATE
   local RealDate, AllDay

   if (Date.year and Date.month and Date.day) then
      RealDate = 1

      -- DETECT ALL-DAY EVENT
      if (Date.hour and Date.min) then
         AllDay    = 0
      else
         AllDay    = 1
         Date.hour = 0
         Date.min  = 0
      end

      -- GET CURRENT LOCAL TIME, UTC OFFSET
      -- These values are referenced in several procedures below.
      local UTC             = os.date('!*t')
      local LocalTime       = os.date('*t')
      local DaylightSavings = LocalTime.isdst and 3600 or 0
      local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

      -- CHANGE 12-HOUR to 24-HOUR
      if Date.Meridiem then
         if (Date.Meridiem == 'AM') and (Date.hour == 12) then
            Date.hour = 0
         elseif (Date.Meridiem == 'PM') and (Date.hour < 12) then
            Date.hour = Date.hour + 12
         end
      end

      -- FIND CLOSEST MATCH FOR TWO-DIGIT YEAR
      if Date.year < 100 then
         local CurrentYear    = LocalTime.year
         local CurrentCentury = math.floor(CurrentYear / 100) * 100
         local IfThisCentury  = CurrentCentury + Date.year
         local IfNextCentury  = CurrentCentury + Date.year + 100
         if math.abs(CurrentYear - IfThisCentury) < math.abs(CurrentYear - IfNextCentury) then
            Date.year = IfThisCentury
         else
            Date.year = IfNextCentury
         end
      end

      -- GET INPUT OFFSET FROM UTC (OR DEFAULT TO LOCAL)
      if (Date.Offset) and (Date.Offset ~= '') then	  
         if Date.Offset:match('%a') then
            Date.Offset = TimeZones[Date.Offset] and (TimeZones[Date.Offset] * 3600) or 0
		
         elseif Date.Offset:match('%d') then 	
            local Direction, Hours, Minutes = Date.Offset:match('^([^%d]-)(%d+)[^%d]-(%d%d)')

            Direction = Direction:match('%-') and -1 or 1
            Hours     = tonumber(Hours) * 3600
            Minutes   = tonumber(Minutes) and (tonumber(Minutes) * 60) or 0

            Date.Offset = (Hours + Minutes) * Direction
         end
      else
         Date.Offset = LocalOffset
      end
	
      -- RETURN CONVERTED DATE
      Date     = os.time(Date) + LocalOffset - Date.Offset
	  
   else
      -- NO USABLE DATE FOUND; USE RETRIEVAL DATE INSTEAD
      RealDate = 0
      AllDay   = 0
      Date     = os.time()
   end

   return Date, AllDay, RealDate
end

  --################################################
  -----------------------------------------------------------------------
-- EVENT FILE MODULE

function EventFile_Initialize()
	local EventFiles = {}
	local AllEventFiles = SELF:GetOption('EventFile', '')
	for EventFile in AllEventFiles:gmatch('[^%|]+') do
		table.insert(EventFiles, EventFile)
	end
	for i, v in ipairs(Feeds) do
		local EventFile = EventFiles[i] or SELF:GetName()..'_Feed'..i..'Events.xml'
		Feeds[i].EventFile = SKIN:MakePathAbsolute(EventFile)
	end
end

function EventFile_Update(a)
	local f = a or f

	local WriteEvents = SELF:GetNumberOption('WriteEvents', 0)
	if (WriteEvents == 1) and (Feeds[f].Type == 'GoogleCalendar') then
		-- CREATE XML TABLE
		local WriteLines = {}
		table.insert(WriteLines, '<EventFile Title="'..Feeds[f].Title..'">')
		for i, v in ipairs(Feeds[f]) do
			local ItemDate = os.date('*t', v.Date)
			table.insert(WriteLines, '<Event Month="'..ItemDate['month']..'" Day="'..ItemDate['day']..'" Desc="'..v.Title..'"/>')
		end
		table.insert(WriteLines, '</EventFile>')
		
		-- WRITE FILE
		local WriteFile = io.output(Feeds[f].EventFile, 'w')
		if WriteFile then
			local WriteContent = table.concat(WriteLines, '\r\n')
			WriteFile:write(WriteContent)
			WriteFile:close()
		else
			SKIN:Bang('!Log', SELF:GetName()..': cannot open file: '..Feeds[f].EventFile)
		end
	end
end

-----------------------------------------------------------------------
-- HISTORY FILE MODULE

function HistoryFile_Initialize()
	-- DETERMINE FILEPATH
	HistoryFile = SELF:GetOption('HistoryFile', SELF:GetName()..'History.xml')
	HistoryFile = SKIN:MakePathAbsolute(HistoryFile)

	-- CREATE HISTORY DATABASE
	History = {}

	-- CHECK IF FILE EXISTS
	local ReadFile = io.open(HistoryFile)
	if ReadFile then
		local ReadContent = ReadFile:read('*all')
		ReadFile:close()

		-- PARSE HISTORY FROM LAST SESSION
		for ReadFeedURL, ReadFeed in ReadContent:gmatch('<feed URL=(%b"")>(.-)</feed>') do
			local ReadFeedURL = ReadFeedURL:match('^"(.-)"$')
			History[ReadFeedURL] = {}
			for ReadItem in ReadFeed:gmatch('<item>(.-)</item>') do
				local Item = {}
				for Key, Value in ReadItem:gmatch('<(.-)>(.-)</.->') do
					Value = Value:gsub('&lt;', '<')
					Value = Value:gsub('&gt;', '>')
					Item[Key] = Value
				end
				Item.Date = tonumber(Item.Date) or Item.Date
				Item.Unread = tonumber(Item.Unread)
				table.insert(History[ReadFeedURL], Item)
			end
		end
	end

	-- ADD HISTORY TO MAIN DATABASE
	-- For each feed, if URLs match, add all contents from History[h] to Feeds[f].
	for f, Feed in ipairs(Feeds) do
		local h = Feed.Measure:GetOption('URL')
		Feeds[f].URL = h
		if History[h] then
			for _, Item in ipairs(History[h]) do
				table.insert(Feeds[f], Item)
			end
		end
	end
end

function HistoryFile_Update(a)
	local f = a or f

	local WriteHistory = SELF:GetNumberOption('WriteHistory', 0)
	if WriteHistory == 1 then
		-- CLEAR AND REBUILD FEED HISTORY
		local h = Feeds[f].URL
		History[h] = {}
		for i, Item in ipairs(Feeds[f]) do
			table.insert(History[h], Item)
		end

		-- GENERATE XML TABLE
		local WriteLines = {}
		for WriteURL, WriteFeed in pairs(History) do
			table.insert(WriteLines, string.format(         '<feed URL=%q>', WriteURL))
			for _, WriteItem in ipairs(WriteFeed) do
				table.insert(WriteLines,                    '\t<item>')
				for Key, Value in pairs(WriteItem) do
					Value = string.gsub(Value, '<', '&lt;')
					Value = string.gsub(Value, '>', '&gt;')
					table.insert(WriteLines, string.format( '\t\t<%s>%s</%s>', Key, Value, Key))
				end
				table.insert(WriteLines,                    '\t</item>')
			end
			table.insert(WriteLines,                        '</feed>')
		end

		-- WRITE XML TO FILE
		local WriteFile = io.open(HistoryFile, 'w')
		if WriteFile then
			local WriteContent = table.concat(WriteLines, '\n')
			WriteFile:write(WriteContent)
			WriteFile:close()
		else
			SKIN:Bang('!Log', SELF:GetName()..': cannot open file: '..HistoryFile)
		end
	end
end

function ClearHistory()
	local DeleteFile = io.open(HistoryFile)
	if DeleteFile then
		DeleteFile:close()
		os.remove(HistoryFile)
		SKIN:Bang('!Log', SELF:GetName()..': deleted history cache at '..HistoryFile)
	end
	SKIN:Bang('!Refresh')
end
    --################################################
-----------------------------------------------------------------------
-- CONSTANTS

TimeZones = {
   IDLW = -12, --  International Date Line West
   NT   = -11, --  Nome
   CAT  = -10, --  Central Alaska
   HST  = -10, --  Hawaii Standard
   HDT  = -9,  --  Hawaii Daylight
   YST  = -9,  --  Yukon Standard
   YDT  = -8,  --  Yukon Daylight
   PST  = -8,  --  Pacific Standard
   PDT  = -7,  --  Pacific Daylight
   MST  = -7,  --  Mountain Standard
   MDT  = -6,  --  Mountain Daylight
   CST  = -6,  --  Central Standard
   CDT  = -5,  --  Central Daylight
   EST  = -5,  --  Eastern Standard
   EDT  = -4,  --  Eastern Daylight
   AST  = -3,  --  Atlantic Standard
   ADT  = -2,  --  Atlantic Daylight
   WAT  = -1,  --  West Africa
   GMT  =  0,  --  Greenwich Mean
   UTC  =  0,  --  Universal (Coordinated)
   Z    =  0,  --  Zulu, alias for UTC
   WET  =  0,  --  Western European
   BST  =  1,  --  British Summer
   CET  =  1,  --  Central European
   MET  =  1,  --  Middle European
   MEWT =  1,  --  Middle European Winter
   MEST =  2,  --  Middle European Summer
   CEST =  2,  --  Central European Summer
   MESZ =  2,  --  Middle European Summer
   FWT  =  1,  --  French Winter
   FST  =  2,  --  French Summer
   EET  =  2,  --  Eastern Europe, USSR Zone 1
   EEST =  3,  --  Eastern European Daylight
   WAST =  7,  --  West Australian Standard
   WADT =  8,  --  West Australian Daylight
   CCT  =  8,  --  China Coast, USSR Zone 7
   JST  =  9,  --  Japan Standard, USSR Zone 8
   EAST = 10,  --  Eastern Australian Standard
   EADT = 11,  --  Eastern Australian Daylight
   GST  = 10,  --  Guam Standard, USSR Zone 9
   NZT  = 12,  --  New Zealand
   NZST = 12,  --  New Zealand Standard
   NZDT = 13,  --  New Zealand Daylight
   IDLE = 12   --  International Date Line East
   }

MonthAcronyms = {
   Jan = 1,
   Feb = 2,
   Mar = 3,
   Apr = 4,
   May = 5,
   Jun = 6,
   Jul = 7,
   Aug = 8,
   Sep = 9,
   Oct = 10,
   Nov = 11,
   Dec = 12
   }

   function DecodeCharacterReference(s, Max)
   if type(s) == 'string' then
      local Max   = Max or 0
      local Loops = 0
      local Matches
      repeat
         Matches = 0
         for Find, Replace in pairs(CharacterReferences) do
            s = s:gsub('&'..Find..';', function() Matches = Matches + 1; return string.char(Replace) end)
         end
         Loops = Loops + 1
      until (Loops == Max) or (Matches == 0)
   end
   return s
end

CharacterReferences = {
   ['#8211']   = 45,
   ['#039']   = 39,
   ['#8216']   = 39,
   ['#8217']   = 39,
   ['#8218']   = 39,
   ['#8219']   = 39,
   ['#8220']   = 34,
   ['#8221']   = 34,
   quot      = 34,
   amp       = 38,
   apos      = 39,
   lt        = 60,
   gt        = 62,
   nbsp      = 160,
   iexcl     = 161,
   cent      = 162,
   pound     = 163,
   curren    = 164,
   yen       = 165,
   brvbar    = 166,
   sect      = 167,
   uml       = 168,
   copy      = 169,
   ordf      = 170,
   laquo     = 171,
   ['not']   = 172,
   shy       = 173,
   reg       = 174,
   macr      = 175,
   deg       = 176,
   plusmn    = 177,
   sup2      = 178,
   sup3      = 179,
   acute     = 180,
   micro     = 181,
   para      = 182,
   middot    = 183,
   cedil     = 184,
   sup1      = 185,
   ordm      = 186,
   raquo     = 187,
   frac14    = 188,
   frac12    = 189,
   frac34    = 190,
   iquest    = 191,
   Agrave    = 192,
   Aacute    = 193,
   Acirc     = 194,
   Atilde    = 195,
   Auml      = 196,
   Aring     = 197,
   AElig     = 198,
   Ccedil    = 199,
   Egrave    = 200,
   Eacute    = 201,
   Ecirc     = 202,
   Euml      = 203,
   Igrave    = 204,
   Iacute    = 205,
   Icirc     = 206,
   Iuml      = 207,
   ETH       = 208,
   Ntilde    = 209,
   Ograve    = 210,
   Oacute    = 211,
   Ocirc     = 212,
   Otilde    = 213,
   Ouml      = 214,
   times     = 215,
   Oslash    = 216,
   Ugrave    = 217,
   Uacute    = 218,
   Ucirc     = 219,
   Uuml      = 220,
   Yacute    = 221,
   THORN     = 222,
   szlig     = 223,
   agrave    = 224,
   aacute    = 225,
   acirc     = 226,
   atilde    = 227,
   auml      = 228,
   aring     = 229,
   aelig     = 230,
   ccedil    = 231,
   egrave    = 232,
   eacute    = 233,
   ecirc     = 234,
   euml      = 235,
   igrave    = 236,
   iacute    = 237,
   icirc     = 238,
   iuml      = 239,
   eth       = 240,
   ntilde    = 241,
   ograve    = 242,
   oacute    = 243,
   ocirc     = 244,
   otilde    = 245,
   ouml      = 246,
   divide    = 247,
   oslash    = 248,
   ugrave    = 249,
   uacute    = 250,
   ucirc     = 251,
   uuml      = 252,
   yacute    = 253,
   thorn     = 254,
   yuml      = 255,
}