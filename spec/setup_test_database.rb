require 'pg'

def setup_test_database
  ENV['ENVIRONMENT'] = 'test'


  p 'Setting up test database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec('TRUNCATE bookmarks, comments, tags, bookmarks_tags;')

end 