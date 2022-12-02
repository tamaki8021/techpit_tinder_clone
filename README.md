# Tinder 風簡易マッチングアプリ

![](https://techpit-market-prod.s3.amazonaws.com/uploads/part_attachment/file/16753/dcf879fd-8ca0-468e-8bfa-20e8f9713efa.gif)


- Ruby on Rails を使った実践的な開発方法を学びます
- Devise を使った認証機能の開発を行います
- 画像アップロード機能の開発を行います
- seed を使った初期データの投入方法を学びます
- Hammer.js を使ってスワイプ機能の開発を行います
- 中間テーブルを利用したデータベース設計方法を学びます
- Action Cable を使ってリアルタイムでメッセージを送る機能の開発を行います

# テーブル設計

## users
| Column            | Type     |
| ------            | ------   |
| name              | string   |
| email             | string   |
| password          | string   |
| gender            | integer  |
| profile_image     | string   |
| self_introduction | text     |

## reactions
| Column        | Type       |
| ------        | ------     |
| status        | integer    |
| to_user_id    | references |
| from_user_id  | references |

## chat_room_users
| Column        | Type       |
| ------        | ------     |
| chat_room_id  | references |
| user_id       | references |

## chat_rooms
| Column        | Type       |
| ------        | ------     |

## chat_messages
| Column        | Type       |
| ------        | ------     |
| chat_room_id  | references |
| user_id       | references |
| content       | text       |