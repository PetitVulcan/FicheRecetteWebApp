using System.Data.SqlClient;

namespace FicheRecette.Tools
{
    public class Connection
    {
        private static SqlConnection _instance = null;
        private static object _lock = new object();

        private Connection()
        {

        }
        public static SqlConnection Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new SqlConnection(@"Server=vps748191.ovh.net;User=c0ficherecette;Password=se5rMLiB@;DataBase=c0FicheRecette");
                        //_instance = new SqlConnection(@"Data Source=(LocalDB)\ListeRecette;Integrated Security=True");
                    }
                    return _instance;
                }
            }
        }
    }    
}
