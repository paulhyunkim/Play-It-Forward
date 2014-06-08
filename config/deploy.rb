set :application, 'play_it_forward'

set :pg_ask_for_password, true

set :stages, %w()
set :deploy_to, "/var/www/play_it_forward"
set :scm, 'git'
set :scm_verbose, true
set :repo_url,  "git@github.com:paulhyunkim/Play-It-Forward.git"
set :branch, 'master'
set :linked_files, ['config/database.yml']
set :linked_dirs, ['log', 'db_backups']
set :deploy_via, :remote_cache
set :rvm_ruby_version, '2.1.0@play_it_forward'

set :runner, 'root'
set :group, 'web'
