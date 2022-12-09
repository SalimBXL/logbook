import './App.css';
import axios from 'axios';
import Articles from "./components/articles";
import { useState, useEffect } from 'react';

const API_URL = "http://127.0.0.1:3000/ping";

const getAPIData = async () => {
  const response = await axios
    .get(API_URL);
  return response.data;
}

function App() {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    getAPIData().then((items) => {
      setArticles(items);
    });
    return;
  }, []);

  return (
    <div className="App">
      <h1>Hello</h1>
      *{Array.isArray(articles)}*
      {`PING! : ${articles}` && !Array.isArray(articles)}
      {<Articles articles={articles} /> && Array.isArray(articles)}
    </div>
  );
}

export default App;
