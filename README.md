[TOC]

# go_learning服务

## 运维发布说明

### db说明

```sql
CREATE DATABASE IF NOT EXISTS go_learning default character set 'utf8mb4';
USE `go_learning`;
CREATE TABLE `go_learning` (
    `order_id` varchar(64) NOT NULL,
    `name` varchar(64) NOT NULL,
    `sex` varchar(16) NOT NULL,
    `extend` text NOT NULL,
    `status` tinyint NOT NULL DEFAULT 0 COMMENT '0:初始状态;1:发货成功',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY `order` (`order_id`) COMMENT '订单唯一',
    INDEX `user` (`name`,`sex`) COMMENT '查询用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- INDEX `user` (`name`,`sex`)是用来查询用户

## 测试用例说明

#### 请求

```shell
curl -v 'http://0.0.0.0/hello_world' \
-H 'Trace-id: xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```

#### 返回

```text
hello world!
```

#### 请求

```shell
curl -v 'http://0.0.0.0/query_order' \
-H 'Trace-id: xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
-H 'Content-type: application/json' \
-d '{
    "order_id": "1234567890"
}'
```

#### 返回

```json
{
    "order_id": "1234567890",
    "name": "0",
    "sex": "provide success",
    "extend": "5201314"
}
```