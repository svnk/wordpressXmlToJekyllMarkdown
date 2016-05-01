# wordpressXmlToJekyllMarkdown
Converts your wordpress Export XML to Jekyll-Friendly Markdown

## Usage

The script expects the export from your wordpress site as "export.xml" in the
same directory. It exports all posts into the directory "posts".

Each post gets exported into a markdown-file fit for import int Jekyll, the static site generator. 
The files are named "YEAR-MONTH-DAY-NAME.md" and have the usual Jekyll Header:

<pre>
---
layout: post
title: $NAME
author: $AUTHOR
---
HERE COMES THE MARKDOWN CONVERTED CONTENT OF THE POST
</pre>

## Install

Download the script or clone the repo. Then

```
gem install nokogiri
gem install upmark
```

and then you can

```
ruby wordpressXmlToJekyllMarkdown.rb
```


## Origin

The idea and code is based on
http://www.ramblinglabs.com/blog/2012/02/migrating-your-blog-posts-to-markdown-with-upmark-and-nokogiri.
I pasted the snippets together, added the necessary requires and extended it
with minimal failur handling and a few more fields.
