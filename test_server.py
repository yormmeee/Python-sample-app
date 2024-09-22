# test_server.py
import unittest
from http.server import HTTPServer
import requests
import threading
from server import SimpleWebServer

class TestWebServer(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Set up a background server thread for testing
        cls.server_address = ('0.0.0.0', 8000)
        cls.httpd = HTTPServer(cls.server_address, SimpleWebServer)
        cls.server_thread = threading.Thread(target=cls.httpd.serve_forever)
        cls.server_thread.daemon = True
        cls.server_thread.start()

    @classmethod
    def tearDownClass(cls):
        # Stop the server after tests
        cls.httpd.shutdown()
        cls.server_thread.join()

    def test_hello_world(self):
        # Send a GET request to the server and test the response
        response = requests.get(f'http://{self.server_address[0]}:{self.server_address[1]}')
        self.assertEqual(response.status_code, 200)
        self.assertIn('Hello, World', response.text)

if __name__ == '__main__':
    unittest.main()
