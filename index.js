var Connection = require('tedious').Connection;  
    var config = {  
        server: 'localhost',  //update me
        authentication: {
            type: 'default',
            options: {
               // userName: 'your_username', //update me
                //password: 'your_password'  //update me
                trustedConnection: true
            }
        },
        options: {
            // If you are on Microsoft Azure, you need encryption:
           //encrypt: true,
            //database: 'your_database'  //update me
        }
    };  
    var connection = new Connection(config);  
    connection.on('connect', function(err) {  
        // If no error, then good to proceed.
        getjugadores();
        console.log("Connected");  
    });
    
    connection.connect();

    var Request = require('tedious').Request;  
    var TYPES = require('tedious').TYPES

    
    function getjugadores() {  
        request = new Request("SELECT [Nombre y Apellido] FROM [Datos Jugadores];", function(err) {  
        if (err) {  
            console.log(err);}  
        });  
        var result = "";  
        request.on('row', function(columns) {  
            columns.forEach(function(column) {  
              if (column.value === null) {  
                console.log('NULL');  
              } else {  
                result+= column.value + " ";  
              }  
            });  
            console.log(result);  
            result ="";  
        });  
  
        request.on('done', function(rowCount, more) {  
        console.log(rowCount + ' rows returned');  
        });  
        
        // Close the connection after the final event emitted by the request, after the callback passes
        request.on("requestCompleted", function (rowCount, more) {
            connection.close();
        });
        connection.execSql(request);  
    }  