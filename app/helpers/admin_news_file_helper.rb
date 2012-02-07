module AdminNewsFileHelper

  def news_file_admin_links(news_file)
    link_to 'Izbrisi', admin_link('news_file', {:action => 'destroy', :id => news_file}), :confirm => del_conf_msg(File.basename(news_file.file))
  end

end