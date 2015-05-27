# SPIM
Simple Personal Infomation Management 
- Does not like CMS, it is lightweight ,using markdown only instead of HTML content editor

## Perspective
### Simple design: 
- simplified priviledge with 3 roles/users: system administator, owner, guest
- most file management as desktop application does
- record events into sqlite3, markdown supported, local file link supported, display as HTML
- addressbook
- all files, events and addressbooks are `tagable` and `remarkable`
- support xls, csv export
- advance: timer

### Network accessible: 
- run as  web server 

### Lightweight as desktop application:
- using [civetweb](https://github.com/bel2125/civetweb), built with lua support.
- using [Lua](http://www.lua.org) as server-side language.
- server-side resource requirement is small, HTML5-friendly browser is required.
