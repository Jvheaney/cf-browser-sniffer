# cf-browser-sniffer
A simple user-agent browser sniffer written in Adobe ColdFusion. &lt;1ms execution time on CF16.

Will require updates to stay current with User-Agent strings. Obviously not definitive (*clients can lie*), but a good enough approach for applications that you're unlikely to be a victim of deception (or it doesn't matter).
A more definitive approach would be detecting the browser rendering engine. I'd suggest that as your next step if you need a little more confidence.

A good reference is the Mozilla User-Agent documentation:

https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
https://developer.mozilla.org/en-US/docs/Web/HTTP/Browser_detection_using_the_user_agent

There is one method, `getBrowserDetails()` which returns a `struct` containing the **browser name** and **version**.

This was developed as a simpler replacement for BrowsCapCFC because of slow performance.

