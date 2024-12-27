class LandingState{
  int? page;
  LandingState({ this.page});
}

class InitState extends LandingState{
  InitState():super(page: 0);
}