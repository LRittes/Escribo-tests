const String SQLSELECTALL = 'SELECT * FROM ';
const String SQLDELETEUSER = 'DELETE FROM user WHERE id = 1';
const String SQLINSERTUSER = 'INSERT INTO user (id, avatar) VALUES (1,?)';

const String SQLINSERTMOVIE =
    'INSERT INTO favMovies (idMovie, name, fav) VALUES (1,?,?)';
const String SQLDELETEMOVIE = 'DELETE FROM favMovies WHERE idMovie = 1';

const String SQLINSERTCHARACTER =
    'INSERT INTO favCharacters (idCharacter, name, fav) VALUES (1,?,?)';
const String SQLDELETECHARACTER =
    'DELETE FROM favCharacters WHERE idCharacter = 1';
