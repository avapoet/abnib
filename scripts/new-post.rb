#!/usr/bin/env ruby
TIME_FORMAT = '%Y-%m-%d %H:%M:%S'
DATE_FORMAT = '%Y-%m-%d'

time = Time::now

print "Date/time [#{time.strftime(TIME_FORMAT)}]: "
if (t = gets.strip) != ''
  time = Time::mktime(*t.split(/[-: ]/))
end

print "Title: "
title = gets.strip

stub = title.gsub(/[^\w]+/, '-').gsub(/^-*/, '').gsub(/-$/, '').downcase
print "Stub [#{stub}]: "
if (s = gets.strip) != ''
  stub = s
end

print "Picture URL [optional]: "
if (pic_url = gets.strip) != ''
  print "Picture title: "
  pic_title = gets.strip
end

puts "Content [line containing just full stop to end]:"
content = new_line = ''
if(pic_url != '')
  content += "![#{pic_title}](#{pic_url})\n\n"
end
while new_line.strip != '.'
  content += new_line
  new_line = gets
end

content += <<-END_OF_SUFFIX

[adam-g]:  http://strokeyadam.livejournal.com/
[adam-w]:  http://www.ad-space.org.uk/
[andy-k]:  http://theguidemark3.livejournal.com/
[andy-r]:  http://selfdoubtgun.wordpress.com/
[beth]:    http://littlegreenbeth.livejournal.com/
[bryn]:    http://randomlyevil.org.uk/
[claire]:  http://nowebsite.co.uk/blog/
[dan]:     http://www.scatmania.org/
[ele]:     http://ele-is-crazy.livejournal.com/
[fiona]:   http://fionafish.wordpress.com/
[hayley]:  http://leelee1983.livejournal.com/
[jen]:     http://scleip.livejournal.com/
[jimmy]:   http://vikingjim.livejournal.com/
[jta]:     http://blog.electricquaker.co.uk/
[kit]:     http://reaperkit.wordpress.com/
[liz]:     http://norasdollhouse.livejournal.com/
[malbo21]: http://malbo21.wordpress.com/
[matt-p]:  http://myzelik.livejournal.com/
[matt-r]:  http://matt-inthe-hat.livejournal.com/
[paul]:    http://blog.pacifist.co.uk/
[penny]:   http://thepennyfaerie.livejournal.com/
[pete]:    http://loonybin345.livejournal.com/
[rory]:    http://razinaber.livejournal.com/
[ruth]:    http://fleeblewidget.co.uk/
[sarah]:   http://starlight-sarah.livejournal.com/
[sian]:    http://elgingerbread.wordpress.com/
[sundeep]: https://mentalwillness.wordpress.com/
END_OF_SUFFIX

######################################################################

final = "---\nlayout: post\ntitle:  \"#{title}\"\ndate:   #{time.strftime(TIME_FORMAT)}\n---\n\n#{content}"
filename = "_posts/#{time.strftime(DATE_FORMAT)}-#{stub}.markdown"
File::open(filename, 'w') do |f|
  f.puts final
end
puts "\nCreated #{filename}"
