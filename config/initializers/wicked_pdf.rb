if Rails.env.production?
  wkhtmltopdf_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
else
  wkhtmltopdf_path = Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')
end
WickedPdf.config = {
  exe_path: wkhtmltopdf_path
}
