import unittest
import requests
from threading import Thread
from http.server import HTTPServer
from web_server import SimpleWebServer  # Updated import

class TestWebServer(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Start the server in a background thread
        server_address = ('', 8000)
        cls.httpd = HTTPServer(server_address, SimpleWebServer)
        cls.server_thread = Thread(target=cls.httpd.serve_forever)
        cls.server_thread.daemon = True
        cls.server_thread.start()

    @classmethod
    def tearDownClass(cls):
        # Shut down the server
        cls.httpd.shutdown()

    def test_get_request(self):
        response = requests.get('http://localhost:8000')
        self.assertEqual(response.status_code, 200)
        self.assertIn('Hello, World', response.text)

if __name__ == '__main__':
    unittest.main()
