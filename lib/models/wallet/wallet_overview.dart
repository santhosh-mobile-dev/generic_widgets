class WalletScoreOverview {
  final String currentReward;
  final int yourContribution;
  final int totalNetworkContribution;
  final int yourShare;

  WalletScoreOverview(
      {this.currentReward,
      this.yourContribution,
      this.totalNetworkContribution,
      this.yourShare});

  factory WalletScoreOverview.fromJson(Map<String, dynamic> json) {
    return WalletScoreOverview(
      currentReward: json['currentReward'],
      yourContribution: json['yourContribution'],
      totalNetworkContribution: json['totalNetworkContribution'],
      yourShare: json['yourShare'],
    );
  }
}
