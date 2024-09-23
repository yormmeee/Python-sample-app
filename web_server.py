from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleWebServer(BaseHTTPRequestHandler):
    def do_GET(self):
        # Respond with 200 OK status
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        
        # Response content: "Hello, World"
        response = "Hello, New World!"
        self.wfile.write(response.encode('utf-8'))

if __name__ == "__main__":
    web_server = HTTPServer(('0.0.0.0', 8000), SimpleWebServer)
    print("Webserver listening http://0.0.0.0:8000")
    web_server.serve_forever()
