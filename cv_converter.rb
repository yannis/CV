require "rubygems"
require "bundler/setup"
require "redcarpet"

class CvConverter
  def initialize
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true), autolink: true, tables: true)
    @french_md = File.read("CV_Yannis_JAQUET_FR.md")
    @english_md = File.read("CV_Yannis_JAQUET_EN.md")
  end

  def call
    File.open("tmp/CV_Yannis_JAQUET_FR.html", "w") { |file|
      file.write temp("CV Yannis Jaquet FR") { @markdown.render @french_md }
      file.close
    }
    File.open("tmp/CV_Yannis_JAQUET_EN.html", "w") { |file|
      file.write temp("CV Yannis Jaquet EN") { @markdown.render @english_md }
      file.close
    }
    system "wkhtmltopdf tmp/CV_Yannis_JAQUET_EN.html tmp/CV_Yannis_JAQUET_EN.pdf"
    system "wkhtmltopdf tmp/CV_Yannis_JAQUET_FR.html tmp/CV_Yannis_JAQUET_FR.pdf"
  end

  def temp(title)
    temp = [%(
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#{title}</title>
    <meta name="author" content="Yannis Jaquet">
    <style>
      #{css_orange}
    </style>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    )]
    temp << yield
    temp << %(
  </body>
</html>
    )
    temp.join
  end

  def css_github
    %(
      body {
        font-family: Roboto, Helvetica, arial, sans-serif;
        font-size: 14px;
        line-height: 1.6;
        background-color: white;
        padding: 50px; }

      body > *:first-child {
        margin-top: 0 !important; }
      body > *:last-child {
        margin-bottom: 0 !important; }

      a {
        color: #4183C4; }
      a.absent {
        color: #cc0000; }
      a.anchor {
        display: block;
        padding-left: 30px;
        margin-left: -30px;
        cursor: pointer;
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0; }

      h1, h2, h3, h4, h5, h6 {
        margin: 20px 0 10px;
        padding: 0;
        font-weight: bold;
        -webkit-font-smoothing: antialiased;
        cursor: text;
        position: relative; }

      h1 tt, h1 code {
        font-size: inherit; }

      h2 tt, h2 code {
        font-size: inherit; }

      h3 tt, h3 code {
        font-size: inherit; }

      h4 tt, h4 code {
        font-size: inherit; }

      h5 tt, h5 code {
        font-size: inherit; }

      h6 tt, h6 code {
        font-size: inherit; }

      h1 {
        font-size: 28px;
        color: black; }

      h2 {
        font-size: 24px;
        border-bottom: 1px solid #cccccc;
        color: black; }

      h3 {
        font-size: 18px; }

      h4 {
        font-size: 16px; }

      h5 {
        font-size: 14px; }

      h6 {
        color: #777777;
        font-size: 14px; }

      p, blockquote, ul, ol, dl, li, table, pre {
        margin: 15px 0; }

      hr {
        border: 0 none;
        color: #cccccc;
        height: 4px;
        padding: 0; }

      body > h2:first-child {
        margin-top: 0;
        padding-top: 0; }
      body > h1:first-child {
        margin-top: 0;
        padding-top: 0; }
        body > h1:first-child + h2 {
          margin-top: 0;
          padding-top: 0; }
      body > h3:first-child, body > h4:first-child, body > h5:first-child, body > h6:first-child {
        margin-top: 0;
        padding-top: 0; }

      a:first-child h1, a:first-child h2, a:first-child h3, a:first-child h4, a:first-child h5, a:first-child h6 {
        margin-top: 0;
        padding-top: 0; }

      h1 p, h2 p, h3 p, h4 p, h5 p, h6 p {
        margin-top: 0; }

      li p.first {
        display: inline-block; }

      ul, ol {
        padding-left: 30px; }

      ul:first-child, ol:first-child {
        margin-top: 0; }

      ul:last-child, ol:last-child {
        margin-bottom: 0; }

      dl {
        padding: 0; }
        dl dt {
          font-size: 14px;
          font-weight: bold;
          font-style: italic;
          padding: 0;
          margin: 15px 0 5px; }
          dl dt:first-child {
            padding: 0; }
          dl dt >:first-child {
            margin-top: 0; }
          dl dt >:last-child {
            margin-bottom: 0; }
        dl dd {
          margin: 0 0 15px;
          padding: 0 15px; }
          dl dd >:first-child {
            margin-top: 0; }
          dl dd >:last-child {
            margin-bottom: 0; }

      blockquote {
        border-left: 4px solid #dddddd;
        padding: 0 15px;
        color: #777777; }
        blockquote >:first-child {
          margin-top: 0; }
        blockquote >:last-child {
          margin-bottom: 0; }

      table {
        padding: 0; }
        table tr {
          border-top: 1px solid #cccccc;
          background-color: white;
          margin: 0;
          padding: 0; }
          table tr:nth-child(2n) {
            background-color: #f8f8f8; }
          table tr th {
            font-weight: bold;
            border: 1px solid #cccccc;
            text-align: left;
            margin: 0;
            padding: 6px 13px; }
          table tr td {
            border: 1px solid #cccccc;
            text-align: left;
            margin: 0;
            padding: 6px 13px; }
          table tr th:first-child, table tr td:first-child {
            margin-top: 0; }
          table tr th:last-child, table tr td:last-child {
            margin-bottom: 0; }

      img {
        max-width: 100%; }

      span.frame {
        display: block;
        overflow: hidden; }
        span.frame > span {
          border: 1px solid #dddddd;
          display: block;
          float: left;
          overflow: hidden;
          margin: 13px 0 0;
          padding: 7px;
          width: auto; }
        span.frame span img {
          display: block;
          float: left; }
        span.frame span span {
          clear: both;
          color: #333333;
          display: block;
          padding: 5px 0 0; }
      span.align-center {
        display: block;
        overflow: hidden;
        clear: both; }
        span.align-center > span {
          display: block;
          overflow: hidden;
          margin: 13px auto 0;
          text-align: center; }
        span.align-center span img {
          margin: 0 auto;
          text-align: center; }
      span.align-right {
        display: block;
        overflow: hidden;
        clear: both; }
        span.align-right > span {
          display: block;
          overflow: hidden;
          margin: 13px 0 0;
          text-align: right; }
        span.align-right span img {
          margin: 0;
          text-align: right; }
      span.float-left {
        display: block;
        margin-right: 13px;
        overflow: hidden;
        float: left; }
        span.float-left span {
          margin: 13px 0 0; }
      span.float-right {
        display: block;
        margin-left: 13px;
        overflow: hidden;
        float: right; }
        span.float-right > span {
          display: block;
          overflow: hidden;
          margin: 13px auto 0;
          text-align: right; }

      code, tt {
        margin: 0 2px;
        padding: 0 5px;
        white-space: nowrap;
        border: 1px solid #eaeaea;
        background-color: #f8f8f8;
        border-radius: 3px; }

      pre code {
        margin: 0;
        padding: 0;
        white-space: pre;
        border: none;
        background: transparent; }

      .highlight pre {
        background-color: #f8f8f8;
        border: 1px solid #cccccc;
        font-size: 13px;
        line-height: 19px;
        overflow: auto;
        padding: 6px 10px;
        border-radius: 3px; }

      pre {
        background-color: #f8f8f8;
        border: 1px solid #cccccc;
        font-size: 13px;
        line-height: 19px;
        overflow: auto;
        padding: 6px 10px;
        border-radius: 3px; }
        pre code, pre tt {
          background-color: transparent;
          border: none; }


)
  end

  def css_orange
    %(
body {
  font-family: Roboto, Helvetica, arial, sans-serif;
  color: #2b2d2f;
  font-size: 12px;
  line-height: 1.5em;
  margin: 0;
  padding: 20px 25px;
  max-width: 1000px;
}
h1 {
  font-size: 24px;
  font-weight: normal;
  line-height: 36px;
  margin: 0;
}

h2 {
  font-size: 14px;
  font-weight: bold;
  line-height: 30px;
  margin: 12px 0 8px;
  border-bottom: 1px solid #eee;
}

h3 {
  font-size: 14px;
  font-weight: 400;
  line-height: 24px;
  margin: 0;
}

.subheader {
        font-size: 18px;
        font-weight: 300;
        color: #ffcc66;
        margin: 0 0 24px;
}

p, ul {
  font-family: Roboto, Helvetica, arial, sans-serif;
  margin: 0 0 6px;
}

a {
  color: #cc5500;
  text-decoration: none;
}

a:hover {
  color: #db0002;
}

table {
  width: 100%;
}

table td {
  vertical-align: top;
}

@media print {
  a::after{
    content: " (" attr(href) ")";
  }
}
)
  end
end
