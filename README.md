
# **DB設計**

usersとgroupsが多対多の関係のため中間テーブルをuser_groupsテーブルとする。

## **users table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|name         |string       |null:false   |

#### **Asociation**
has_many messages
has_many groups
has_many groups, through :user_groups

## **groups table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|name         |string       |null:false   |

#### **Asociation**
has_many messages
has_many users
has_many users, through :user_groups

## **user_groups table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|group        |references   |foreign_key  |
|user         |references   |foreign_key  |

#### **Asociation**
belongs_to user
belongs_to group

## **messages table**

|Column       |type         |option       |
|:------------|:------------|:------------|
|body         |text         |             |
|image        |string       |             |
|group        |references   |foreign_key  |
|user         |references   |foreign_key  |

#### **Asociation**
belongs_to user
belongs_to group
