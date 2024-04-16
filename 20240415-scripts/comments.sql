CREATE TABLE
    comments
    (
        id INT
        ,content VARCHAR(100)
        ,post_id INT
        ,FOREIGN KEY (post_id)
            REFERENCES posts(id)
        ,PRIMARY KEY (id)
    )
;
