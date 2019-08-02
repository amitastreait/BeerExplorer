public with sharing class ViewIdeaWrapper {
    @AuraEnabled
    public Idea idea { get; set; }
    @AuraEnabled
    public List<IdeaComment> ideaCommentList { get; set; }
    @AuraEnabled
    public List<Vote> ideaVotes { get; set; }
    
    public ViewIdeaWrapper(Idea idea, List<IdeaComment> ideaCommentList, List<Vote> ideaVotes){
        this.idea = idea;
        this.ideaCommentList = ideaCommentList;
        this.ideaVotes = ideaVotes;
    }
}