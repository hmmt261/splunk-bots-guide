# Splunk BOTS v1 ~ v3 解き方ガイド

Splunk 社のセキュリティ演習データセット **Boss of the SOC (BOTS)** v1・v2・v3 を使った演習（全 98 問）の
解き方を解説するガイドです。

## 構成

```
book/                 本文（AsciiDoc）
  main.adoc           入口（属性と章の include）
  introduction.adoc   はじめに
  basics.adoc         Splunk 調査の基本
  botsv1-*.adoc       BOTSv1（101〜414）
  botsv2-*.adoc       BOTSv2（1101〜1509）
  botsv3-*.adoc       BOTSv3（2100〜2403）
  closing.adoc        まとめ
  appendix.adoc       解答一覧・参考資料
generate.sh           dist/index.html を生成する
.github/workflows/    GitHub Pages へのデプロイ
```

体裁は [AWSによるクラウド入門](https://tomomano.gitlab.io/intro-aws/) を参考にしています。
Asciidoctor の HTML 出力（左サイドバーの目次・節番号・rouge によるコードの色付け）を使っています。

## ビルド

Ruby と Bundler がある場合:

```bash
bundle install
./generate.sh          # dist/index.html ができる
```

Docker を使う場合:

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/documents \
  asciidoctor/docker-asciidoctor:1.80 \
  asciidoctor -o dist/index.html book/main.adoc
```

## 出典

- BOTS のデータセットとシナリオ: Splunk（[botsv1](https://github.com/splunk/botsv1) / [botsv2](https://github.com/splunk/botsv2) / [botsv3](https://github.com/splunk/botsv3)）
