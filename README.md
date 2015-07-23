# TVDB Api

## Installation

The current version still in development and not production ready

    gem 'tvdb_api', git: 'git@github.com:PeterWuMC/tvdb_api.git'

## Setup

There are features within this api that requires authorisation token, which you can get it from [Tvdb api registration form](http://thetvdb.com/?tab=apiregister)

And set the token in your application

    TvdbApi::Client.set_token("#{token}")


## Interface

###Language

    TvdbApi::Language.find_by_name('English')
    => #<TvdbApi::Language:0x007ffb96b043e0 @raw={"name"=>"English", "abbreviation"=>"en", "id"=>"7"}, @name="English", @abbreviation="en", @id="7">

    TvdbApi::Language.find_by_abbreviation('en')
    => #<TvdbApi::Language:0x007f86249f90c8 @raw={"name"=>"English", "abbreviation"=>"en", "id"=>"7"}, @name="English", @abbreviation="en", @id="7">

    TvdbApi::Language.find_by_id(7)
    => #<TvdbApi::Language:0x007f8624a00418 @raw={"name"=>"English", "abbreviation"=>"en", "id"=>"7"}, @name="English", @abbreviation="en", @id="7">

## Series

    TvdbApi::Serie.find_by_name('Big bang theory')
    => [#<TvdbApi::Serie:0x007f8a93183b50 @raw={"seriesid"=>"80379", "SeriesName"=>"The Big Bang Theory", "banner"=>"graphical/80379-g23.jpg", "Overview"=>"What happens when hyperintelligent roommates Sheldon and Leonard meet Penny, a free-spirited beauty moving in next door, and realize they know next to nothing about life outside of the lab. Rounding out the crew are the smarmy Wolowitz, who thinks he's as sexy as he is brainy, and Koothrappali, who suffers from an inability to speak in the presence of a woman.", "FirstAired"=>"2007-09-24", "Network"=>"CBS", "IMDB_ID"=>"tt0898266", "zap2it_id"=>"EP00931182", "id"=>"80379"}, @language=#<TvdbApi::Language:0x007f8a92154c70 @raw={"name"=>"English", "abbreviation"=>"en", "id"=>"7"}, @id="7", @name="English", @abbreviation="en">, @id="80379", @name="The Big Bang Theory", @banner="graphical/80379-g23.jpg", @overview="What happens when hyperintelligent roommates Sheldon and Leonard meet Penny, a free-spirited beauty moving in next door, and realize they know next to nothing about life outside of the lab. Rounding out the crew are the smarmy Wolowitz, who thinks he's as sexy as he is brainy, and Koothrappali, who suffers from an inability to speak in the presence of a woman.", @first_aired="2007-09-24", @network="CBS", @imdb_id="tt0898266", @zap2id_id="EP00931182">]

    TvdbApi::Serie.find_by_name('Big bang theory', TvdbApi::Language.find_by_abbreviation('fi'))
    => [#<TvdbApi::Serie:0x007f8a919ffa10 @raw={"seriesid"=>"80379", "SeriesName"=>"The Big Bang Theory", "banner"=>"graphical/80379-g23.jpg", "Overview"=>"De vrienden Sheldon, Leonard, Raj en Howard zijn echte geeks met een voorliefde voor wetenschap. Ze snappen alles op het gebied van natuur- en scheikunde, maar voeg atomen samen tot een vrouw en het bevattingsvermogen van de mannen komt tot stilstand. Gelukkig hebben ze hun blonde buurvrouw Penny die lang niet zo slim is, maar wel de sociale vaardigheden beheerst die het viertal mist.", "FirstAired"=>"2007-09-24", "Network"=>"CBS", "IMDB_ID"=>"tt0898266", "zap2it_id"=>"EP00931182", "id"=>"80379"}, @language=#<TvdbApi::Language:0x007f8a92155a80 @raw={"name"=>"Nederlands", "abbreviation"=>"nl", "id"=>"13"}, @id="13", @name="Nederlands", @abbreviation="nl">, @id="80379", @name="The Big Bang Theory", @banner="graphical/80379-g23.jpg", @overview="De vrienden Sheldon, Leonard, Raj en Howard zijn echte geeks met een voorliefde voor wetenschap. Ze snappen alles op het gebied van natuur- en scheikunde, maar voeg atomen samen tot een vrouw en het bevattingsvermogen van de mannen komt tot stilstand. Gelukkig hebben ze hun blonde buurvrouw Penny die lang niet zo slim is, maar wel de sociale vaardigheden beheerst die het viertal mist.", @first_aired="2007-09-24", @network="CBS", @imdb_id="tt0898266", @zap2id_id="EP00931182">]

    TvdbApi::Serie.find_by_id(80379)
    => #<TvdbApi::Serie:0x007f8a921e1b98 @raw={"id"=>"80379", "Actors"=>"|Jim Parsons|Johnny Galecki|Kaley Cuoco|Simon Helberg|Kunal Nayyar|Melissa Rauch|Mayim Bialik|", "Airs_DayOfWeek"=>"Monday", "Airs_Time"=>"8:00 PM", "ContentRating"=>"TV-PG", "FirstAired"=>"2007-09-24", "Genre"=>"|Comedy|", "IMDB_ID"=>"tt0898266", "Language"=>"en", "Network"=>"CBS", "NetworkID"=>nil, "Overview"=>"What happens when hyperintelligent roommates Sheldon and Leonard meet Penny, a free-spirited beauty moving in next door, and realize they know next to nothing about life outside of the lab. Rounding out the crew are the smarmy Wolowitz, who thinks he's as sexy as he is brainy, and Koothrappali, who suffers from an inability to speak in the presence of a woman.", "Rating"=>"9.2", "RatingCount"=>"1079", "Runtime"=>"30", "SeriesID"=>"58056", "SeriesName"=>"The Big Bang Theory", "Status"=>"Continuing", "added"=>nil, "addedBy"=>nil, "banner"=>"graphical/80379-g23.jpg", "fanart"=>"fanart/original/80379-34.jpg", "lastupdated"=>"1437619857", "poster"=>"posters/80379-18.jpg", "tms_wanted_old"=>"1", "zap2it_id"=>"EP00931182"}, @id="58056", @name="The Big Bang Theory", @banner="graphical/80379-g23.jpg", @overview="What happens when hyperintelligent roommates Sheldon and Leonard meet Penny, a free-spirited beauty moving in next door, and realize they know next to nothing about life outside of the lab. Rounding out the crew are the smarmy Wolowitz, who thinks he's as sexy as he is brainy, and Koothrappali, who suffers from an inability to speak in the presence of a woman.", @first_aired="2007-09-24", @network="CBS", @imdb_id="tt0898266", @zap2id_id="EP00931182", @actors="|Jim Parsons|Johnny Galecki|Kaley Cuoco|Simon Helberg|Kunal Nayyar|Melissa Rauch|Mayim Bialik|", @airs_day_of_week="Monday", @airs_time="8:00 PM", @content_rating="TV-PG", @genre="|Comedy|", @rating="9.2", @rating_count="1079", @runtime="30", @status="Continuing", @last_updated="1437619857", @fan_art="fanart/original/80379-34.jpg", @poster="posters/80379-18.jpg">

    TvdbApi::Serie.find_by_id(80379, TvdbApi::Language.find_by_abbreviation('fi'))
    => #<TvdbApi::Serie:0x007f8a91a50258 @raw={"id"=>"80379", "Actors"=>"|Jim Parsons|Johnny Galecki|Kaley Cuoco|Simon Helberg|Kunal Nayyar|Melissa Rauch|Mayim Bialik|", "Airs_DayOfWeek"=>"Monday", "Airs_Time"=>"8:00 PM", "ContentRating"=>"TV-PG", "FirstAired"=>"2007-09-24", "Genre"=>"|Comedy|", "IMDB_ID"=>"tt0898266", "Language"=>"fi", "Network"=>"CBS", "NetworkID"=>nil, "Overview"=>"The Big Bang Theory kertoo kahdesta fyysikkonörtistä Leonardista ja Sheldonista, jotka eivät tiedä naisista mitään. Heidän naapuriinsa muuttaa hyvännäköinen nainen nimeltään Penny. Erityisesti Leonard kiinnostuu Pennystä. Sarjassa ovat tärkeässä osassa myös Leonardin ja Sheldonin ystävät tähtitieteilijä Raj ja insinööri Howard. Sarjassa käsitellään mm. tiedettä, science fictionia, erilaisia elämänkatsomuksia ja ihmissuhdekuvioita.", "Rating"=>"9.2", "RatingCount"=>"1079", "Runtime"=>"30", "SeriesID"=>"58056", "SeriesName"=>"Rillit huurussa", "Status"=>"Continuing", "added"=>nil, "addedBy"=>nil, "banner"=>"graphical/80379-g23.jpg", "fanart"=>"fanart/original/80379-34.jpg", "lastupdated"=>"1437619857", "poster"=>"posters/80379-18.jpg", "tms_wanted_old"=>"1", "zap2it_id"=>"EP00931182"}, @id="58056", @name="Rillit huurussa", @banner="graphical/80379-g23.jpg", @overview="The Big Bang Theory kertoo kahdesta fyysikkonörtistä Leonardista ja Sheldonista, jotka eivät tiedä naisista mitään. Heidän naapuriinsa muuttaa hyvännäköinen nainen nimeltään Penny. Erityisesti Leonard kiinnostuu Pennystä. Sarjassa ovat tärkeässä osassa myös Leonardin ja Sheldonin ystävät tähtitieteilijä Raj ja insinööri Howard. Sarjassa käsitellään mm. tiedettä, science fictionia, erilaisia elämänkatsomuksia ja ihmissuhdekuvioita.", @first_aired="2007-09-24", @network="CBS", @imdb_id="tt0898266", @zap2id_id="EP00931182", @actors="|Jim Parsons|Johnny Galecki|Kaley Cuoco|Simon Helberg|Kunal Nayyar|Melissa Rauch|Mayim Bialik|", @airs_day_of_week="Monday", @airs_time="8:00 PM", @content_rating="TV-PG", @genre="|Comedy|", @rating="9.2", @rating_count="1079", @runtime="30", @status="Continuing", @last_updated="1437619857", @fan_art="fanart/original/80379-34.jpg", @poster="posters/80379-18.jpg">
