public with sharing class NewsAPIWrapper {
    public NewsAPIWrapper() {

    }

    public String status;
	public Integer totalResults;	
	public List<Articles> articleList;
	public class Articles {
		public Source source;
		public String author;	
		public String title;	
		public String description;	
		public String url;	
		public String urlToImage;	
		public String publishedAt;	
		public String content;	
	}
	Public class Source {
		public String id;	
		public String name;	
	}
}