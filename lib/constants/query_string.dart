class QueryString{
  static String readCounters = """
query {
    launchesPast{
         mission_name
    launch_date_local
    launch_site {
      site_name_long
    }
    links {
      article_link
      video_link
    }
     rocket {
      rocket_name
     }
     ships {
      name
      home_port
      image
    }
    }
}""";
}