import React from "react";

const Articles = ({articles}) => {
    return <div>
        <h1>Articles</h1>
        {articles.map((article) => {
            return (
                <div key={article.id}>
                    <h3>{article.title}</h3>
                    <p>{article.text}</p>
                </div>
            );
        })}
    </div>;
};

export default Articles;