# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : __2.5.0__

* Rails version : __5.1.6__

* Database : __PostgreSQL__

* Testing Framework : __Rspec, FactoryBot__

* How to run the test suite : __bundle exec rake spec__

* Services (job queues, cache servers, search engines, etc.) : __ElasticSearch__

Start the ElasticSearch Engine before executing the Program.
  sudo service elasticsearch start
  
Currently supporting search of albums only(no search by songs).
To Create Index adn to Import data for MusicAlbumModel :-
  __MusicAlbum._elasticsearch_.create_index! force: true__
  __MusicAlbum.import__
