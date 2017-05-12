cookbook_file '/tmp/createdb.sql' do 
	source 'createdb.sql'
	action :create
end

execute "Running mysql database creation" do
	command "mysql </tmp/createdb.sql"
end
