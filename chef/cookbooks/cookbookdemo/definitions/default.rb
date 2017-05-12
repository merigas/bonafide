define :compile_httpd, loca: "/d01/apache" do

execute 'httpd extract' do
        command 'tar -xzf httpd-2.4.25.tar.gz'
        cwd '/opt'
end

execute 'configure httpd' do
        command "./configure --prefix=#{params[:loca]}"
        cwd '/opt/httpd-2.4.25'
end

execute 'Running make clean' do
        command 'make clean'
        cwd '/opt/httpd-2.4.25'
end

execute 'Running make ' do
        command 'make'
        cwd '/opt/httpd-2.4.25'
end

execute 'Running make install' do
        command 'make install'
        cwd '/opt/httpd-2.4.25'
end

end
