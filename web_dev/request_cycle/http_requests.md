1. What are some common HTTP status codes?

200 - OK
300 - (Multiple Choices) The resource has multiple choices and can't be resolved into one
301 - (Moved Permanently) Resource has been assigned a new permanent URI
302 - (Found) Resource temporarily assigned a different URI
304 - (Not Modified) Performed conditional GET request, but document not modified
307 - (Temporary Redirect) Resource temporarily assigned a different URI
400 - (Bad Request) Request could not be understood by the server due to syntax
401 - (Unauthorized) Request requires user authentication
403 - (Forbidden) Server understood request, but is refusing to fulfill it
404 - (Not Found) Server hasn't found anything matching Request-URI
410 - (Gone) Resource is no longer available at the server and no forwarding address is known
500 - (Internal Server Error) Server encountered unexpected condition which prevented it from fulfilling request
501 - (Not Implemented) Server doesn't support functionality to fulfill the request
503 - (Service Unavailable) Server unable to handle Request at the time
550 - (Permission Denied) Account currently logged in as doesn't have permission to perform action attempted  

2. What is the difference between a GET request and a POST request? When might each be used?

A GET request requests data from a specified source while a POST submits data to be processed to a specified source. A GET request would be used if you wanted to generate a user's profile page, while a POST request would be used if a user was submitting a comment to a thread. 

3. What is a cookie? How does it relate to HTTP requests?

A cookie is a chunk of data that a server sends to a browser so that it may be stored and sent back with the next request to the same server. Used to know if two requests came from the same browser. Remembers stateful information in the stateless HTTP protocol. 