# tarpit-http

This accepts HTTP connections at 127.0.0.1:[port]/tarpit and sends random numbers to the client every 5 seconds forever. The purpose of this is to tie-up the resources of malicious bots for as long as possible.

You could set this up, and add it as a link on your website, hidden by CSS and titled "don't click this". The bots will blindly following the link and get stuck, but users relying on screen-readers would know to not click the link.

This is inspired by [EndleSSH](https://nullprogram.com/blog/2019/03/22/).

## Known Bugs

- The handler ```tarpit``` keeps trying to send numbers even after the client disconnects. The loop needs to somehow check that the client is still connected.
- The only logging this does is to print the client's IP address and the random number sent. This needs to be replaced with a real logging subsystem, so I can quickly see the following:
  - The quantity of current connections, and of past connections.
  - The duration of each connection. The longest duration and average duration would be nice too.
  - The IP address and user-agent of each connection.
- There is no limit on the number of connections or RAM usage, so this could exhaust CPU and/or RAM usage if you get enough connections.

## Future Work (besides fixing bugs)

- Make tarpits for other protocols (e.g. SMTP, FTP, and whatever else the skiddies, techbros, and FBI like to touch).
- Convince people to setup tarpits across the internet.
