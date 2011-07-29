.pragma library

function getDatabase() {
     return openDatabaseSync("DOFCalc", "1.0", "DOF Preferences Database", 100000);
}

// At the start of the application, we can initialize the tables we need if they haven't been created yet
function initialize() {
    var db = getDatabase();
    db.transaction(
        function(tx) {
            // Create the settings table if it doesn't already exist
            // If the table exists, this is skipped
            tx.executeSql('CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS camera(name TEXT UNIQUE, coc INT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS lens(focal FLOAT UNIQUE)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS aperture(fstop FLOAT UNIQUE)');
          });
}

// This function is used to write a setting into the database
function setSetting(setting, value) {
   // setting: string representing the setting name (eg: “username”)
   // value: string representing the value of the setting (eg: “myUsername”)
   var db = getDatabase();
   var res = "";
   db.transaction(function(tx) {
        var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
              if (rs.rowsAffected > 0) {
                res = "OK";
              } else {
                res = "Error";
              }
        }
  );
  return res;
}
// This function is used to retrieve a setting from the database
function getSetting(setting, defaultval) {
   var db = getDatabase();
   var res="";
   db.transaction(function(tx) {
     var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
     if (rs.rows.length > 0) {
          res = rs.rows.item(0).value;
     } else {
         res = defaultval;
     }
  })
  return res
}

function getCameras() {
    var db = getDatabase();
    var res = Array();
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM camera');
        for (var i = 0; i < rs.rows.length; i++) {
            res.push({'name': rs.rows.item(i).name, 'coc': rs.rows.item(i).coc})
        }
   })
   return res
}

function addCamera(name, coc) {
    var db = getDatabase();
    var res = "";
    db.transaction(function(tx) {
         var rs = tx.executeSql('INSERT OR REPLACE INTO camera VALUES (?,?);', [name, coc]);
               if (rs.rowsAffected > 0) {
                 res = "OK";
               } else {
                 res = "Error";
               }
         }
   );
   return res;
}
