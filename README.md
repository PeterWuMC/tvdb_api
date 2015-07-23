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

    TvdbApi::Language.find_by_name
    TvdbApi::Language.find_by_id
