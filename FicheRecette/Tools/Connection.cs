using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace FicheRecette.Tools
{
    public class Connection
    {
        private static MySqlConnection _instance = null;
        private static object _lock = new object();

        private Connection()
        {

        }
        public static MySqlConnection Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new MySqlConnection(@"Server=vps748191.ovh.net;User=c0ficherecette;Password=se5rMLiB@;DataBase=c0FicheRecette");
                    }
                    return _instance;
                }
            }
        }
    }    
}
