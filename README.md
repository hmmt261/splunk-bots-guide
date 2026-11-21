# Splunk BOTS v1 ~ v3 解き方ガイド

本書は，Splunk 社のセキュリティ演習データセット **Boss of the SOC（BOTS）** を使い，演習環境（BOTS Lab）で出題される全 98 問の解き方を解説する．各問では，どのログに着目し，どのような SPL で検索し，結果のどこを読めば答えにたどり着くかを示す．

**[ガイドを読む（GitHub Pages）](https://hmmt261.github.io/splunk-bots-guide/)**

## 扱うシナリオ

| データセット | 問題数 | 主な調査対象 |
| --- | ---: | --- |
| [BOTS v1](https://hmmt261.github.io/splunk-bots-guide/#chap_botsv1_web) | 28 | Wayne Enterprises の Web サイト改ざん，Cerber ランサムウェアの感染経路 |
| [BOTS v2](https://hmmt261.github.io/splunk-bots-guide/#chap_botsv2_amber) | 38 | Frothly 社の内部不正，フォーラムへの攻撃，macOS 端末の侵害，EC サイトの不正利用 |
| [BOTS v3](https://hmmt261.github.io/splunk-bots-guide/#chap_botsv3_aws) | 32 | AWS 環境でのコインマイニング，Windows 端末と Linux サーバーの侵害 |

## 演習の進め方

SPL に慣れていない場合は，先に「Splunk 調査の基本」を読むとよい．利用できるログの種類を確かめ，ドメイン名や IP アドレスを手がかりに検索を絞る手順を扱う．[Splunk 調査の基本](https://hmmt261.github.io/splunk-bots-guide/#chap_basics)

自分の Splunk で試すときは，対象のデータセットを取り込み，検索画面の時間範囲を **全時間（All time）** にする．各問の「方針」を読んで SPL を実行し，ログのどの値が答えの根拠になるかを確かめる．答え合わせをするときは，問題末尾の「答え」を開く．

## 本文の編集とビルド

本文の原稿は `book/` にある．各章は AsciiDoc で記述し，`main.adoc` で掲載順に読み込む．[本文の原稿](book/) · [章の掲載順](book/main.adoc)

Ruby と Bundler を使う場合は，リポジトリのルートで次のコマンドを実行する．

```bash
bundle install
./generate.sh
```

Docker を使う場合は，同じディレクトリで次のコマンドを実行する．

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/documents \
  asciidoctor/docker-asciidoctor:1.80 \
  asciidoctor -o dist/index.html book/main.adoc
```

生成した `dist/index.html` をブラウザーで開くと，編集した箇所を確認できる．`main` に変更を反映すると，GitHub Actions が本文をビルドし，GitHub Pages に公開する．

## 出典

- データセットとシナリオは Splunk 社が公開している．[BOTS v1](https://github.com/splunk/botsv1) · [BOTS v2](https://github.com/splunk/botsv2) · [BOTS v3](https://github.com/splunk/botsv3)
- 本書の体裁は『AWSによるクラウド入門』を参考にした．[AWSによるクラウド入門](https://tomomano.gitlab.io/intro-aws/)
