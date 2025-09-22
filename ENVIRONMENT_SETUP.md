# 多环境数据库配置说明

## 环境配置

项目现在支持三个环境：
- **dev** (开发环境)
- **test** (测试环境)  
- **prod** (生产环境)

## 数据库配置

每个环境使用不同的数据库：

| 环境 | 数据库名 | 端口 | 说明 |
|------|----------|------|------|
| dev | instock_dev | 9990 | 开发环境数据库 |
| test | instock_test | 9989 | 测试环境数据库 |
| prod | instock_prod | 9988 | 生产环境数据库 |

## 使用方法

### 方法一：使用启动脚本（推荐）

```bash
# 启动开发环境
start_dev.bat

# 启动测试环境  
start_test.bat

# 启动生产环境
start_prod.bat
```

### 方法二：设置环境变量

```bash
# Windows
set ENV=dev
python instock/main.py

set ENV=test
python instock/main.py

set ENV=prod
python instock/main.py

# Linux/Mac
export ENV=dev
python instock/main.py

export ENV=test
python instock/main.py

export ENV=prod
python instock/main.py
```

### 方法三：使用 Docker

```bash
# 启动开发环境
docker-compose up instock-dev

# 启动测试环境
docker-compose up instock-test

# 启动生产环境
docker-compose up instock-prod

# 启动所有环境
docker-compose up
```

## 配置修改

### 修改数据库配置

编辑 `instock/lib/database.py` 文件中的 `DB_CONFIGS` 字典：

```python
DB_CONFIGS = {
    'dev': {
        'host': '192.168.1.106',
        'user': 'joing',
        'password': 'anlizi1314',
        'database': 'instock_dev',
        'port': 3306,
        'charset': 'utf8mb4'
    },
    'test': {
        'host': '192.168.1.106',
        'user': 'joing',
        'password': 'anlizi1314',
        'database': 'instock_test',
        'port': 3306,
        'charset': 'utf8mb4'
    },
    'prod': {
        'host': '192.168.1.106',
        'user': 'joing',
        'password': 'anlizi1314',
        'database': 'instock_prod',
        'port': 3306,
        'charset': 'utf8mb4'
    }
}
```

### 使用环境变量覆盖

可以通过环境变量覆盖默认配置：

```bash
set ENV=dev
set db_host=localhost
set db_user=root
set db_password=123456
set db_database=my_instock_dev
python instock/main.py
```

## 注意事项

1. 确保每个环境都有对应的数据库
2. 生产环境请使用强密码
3. 建议为不同环境使用不同的数据库服务器
4. 定期备份生产环境数据
5. 测试环境数据可以定期清理

## 数据库初始化

首次使用前，需要为每个环境创建对应的数据库：

```sql
CREATE DATABASE instock_dev CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE instock_test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE instock_prod CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## 环境切换示例

```bash
# 开发环境
set ENV=dev
python instock/main.py

# 测试环境
set ENV=test
python instock/main.py

# 生产环境
set ENV=prod
python instock/main.py
```

## Docker 环境切换

```bash
# 只启动开发环境
docker-compose up instock-dev

# 只启动测试环境
docker-compose up instock-test

# 只启动生产环境
docker-compose up instock-prod

# 启动所有环境
docker-compose up
```
