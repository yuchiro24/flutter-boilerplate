# aufguss_event_app

アウフグースのイベント閲覧アプリ

## Install

```
fvm install
fvm flutter pub get
```

## Run
### dev
```
sh/run_debug_development.sh <deviceId>
```
### prod
```
sh/run_release_production.sh <deviceId>
```

## ファイル構造
### lib/common
- 共通の色/enum/extensionなどなど

### lib/domain
#### lib/domain/entities
- Entity定義
- freezed & json_serializableを使用
- 更新&新規作成時は↓のコマンドを実行
```
sh/build_runner.sh
```

#### lib/domain/notifiers
- シングルトンの状態管理
- freezed + stateNotifier
- 更新&新規作成時は↓のコマンドを実行
```
sh/build_runner.sh
```

#### lib/domain/repository
- data_sourceの実行クラスの関数定義
#### lib/domain/repository/data_source
- 実際に処理するところ

### lib/domain/dto
- repositoryに関するデータ

### lib/l10n
- 文言定義ファイル
- 追加したら即反映される 
- 使用例↓
```
context.l10.〇〇
```
- 警告が消えない場合は `fvm flutter pub get` or エディタを再起動すると反映される

### lib/presentation
#### lib/presentation/pages
- 各ページの実装部分
```
〇〇/〇〇_page.dart          : UI実装
   /〇〇_page_notifier.dart : ページで使うstate & ロジック (freezed + stateNotifier)
```
- 更新&新規作成時は↓のコマンドを実行
```
sh/build_runner.sh
```
#### lib/presentation/widgets
- 共通コンポーネント/widget


