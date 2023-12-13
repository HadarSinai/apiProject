using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;


namespace Repository
{
    public class RatingRepository : IRatingRepository
    {
        public IConfiguration _configuration { get; }
      
        public RatingRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            
        }
        public async Task createRating(Rating rating)
        {
           
            string? HOST, METHOD, PATH, REFERER, USER_AGENT;
            DateTime? Record_Date;
            HOST = rating.Host;
            METHOD = rating.Method;
            PATH = rating.Path;
            REFERER = rating.Referer;
            USER_AGENT = rating.UserAgent;
            Record_Date = rating.RecordDate;
            string query = "insert into RATING(HOST,METHOD,PATH,REFERER,USER_AGENT,Record_Date)" +
            "Values(@HOST,@METHOD,@PATH,@REFERER,@USER_AGENT,@Record_Date)";
            using (SqlConnection con = new SqlConnection(_configuration.GetConnectionString("Shoes")))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@HOST", SqlDbType.NVarChar, 60).Value = HOST;
                cmd.Parameters.Add("@METHOD", SqlDbType.NChar, 15).Value = METHOD;
                cmd.Parameters.Add("@PATH", SqlDbType.NVarChar, 50).Value = PATH;
                cmd.Parameters.Add("@REFERER", SqlDbType.NVarChar, 90).Value = REFERER;
                cmd.Parameters.Add("@USER_AGENT", SqlDbType.NVarChar, int.MaxValue).Value = USER_AGENT;
                cmd.Parameters.Add("@Record_Date", SqlDbType.DateTime).Value = Record_Date;
                con.Open();
                int rowsAffected =  cmd.ExecuteNonQuery();
                //int rowsAffected = await cmd.ExecuteNonQueryAsync();

                con.Close();


            }

        }
    }
}


