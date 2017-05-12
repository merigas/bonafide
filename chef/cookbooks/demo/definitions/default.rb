define :compile_httpd, loc: "/d01/apache" do 
	remote_file '/opt/httpd-2.4.25.tar.gz' do
  		source 'http://mirror.fibergrid.in/apache//httpd/httpd-2.4.25.tar.gz'
  		action :create
	end

	execute 'httpd extract' do
        	command 'tar -xzf httpd-2.4.25.tar.gz'
        	cwd '/opt'
	end

	execute 'configure httpd' do
        	command "./configure --prefix=#{params[:loc]}"
	        cwd '/opt/httpd-2.4.25'	
	end
end
