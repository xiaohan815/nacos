# 技术栈

## 后端

### 核心技术
- **语言**：Java 8+
- **构建工具**：Maven 3.0.3+
- **框架**：Spring Boot 2.7.18, Spring Framework 5.3.34, Spring Security 5.7.12
- **数据库**：MySQL 8.0.33, Derby 10.14.2.0
- **RPC**：gRPC 1.64.2, Protocol Buffers 3.22.3
- **一致性算法**：JRaft 1.3.14（Raft 共识算法）
- **认证**：JWT (jjwt 0.11.2)
- **连接池**：HikariCP 3.4.2
- **日志**：SLF4J 1.7.26, Logback 1.2.13, Log4j 2.17.1

### 测试
- **测试框架**：JUnit 5.10.2, Mockito 4.11.0

## 前端 (console-ui)

### 核心技术
- **框架**：React 16.12.0
- **状态管理**：Redux 4.0.5, React-Redux 7.1.3
- **路由**：React Router 5.1.2
- **UI 组件库**：阿里巴巴 Fusion Design (@alifd/next 1.26.24)
- **构建工具**：Webpack 4.43.0
- **转译器**：Babel 7
- **HTTP 客户端**：Axios 0.21.1
- **样式**：Sass/SCSS

### 开发工具
- **代码检查**：ESLint 6.8.0（使用阿里巴巴配置）
- **代码格式化**：Prettier 1.19.1
- **Git 钩子**：Husky 3.1.0, lint-staged 9.5.0

## 常用构建命令

### 后端 (Maven)

```bash
# 完整编译（推荐使用项目提供的脚本）
# Windows: build.bat
# Linux/Mac: 使用以下命令

# 标准构建命令（生成 nacos-server.jar）
mvn clean install -Prelease-nacos -Dmaven.test.skip=true -Drat.skip=true

# 安装依赖并构建（包含测试）
mvn clean install

# 仅运行测试
mvn test

# 运行配置模块集成测试
mvn test -Pcit-test

# 运行命名模块集成测试
mvn test -Pnit-test

# 清理测试数据
mvn clean -Premove-test-data

# 生成 Eclipse 项目文件
mvn -U eclipse:eclipse
```

### 构建说明

- **主要构建产物**：`console/target/nacos-server.jar`（约 100+ MB）
- **构建时间**：通常需要 2-3 分钟
- **常见问题**：
  - 如遇到文件锁定问题，需先关闭 Java 进程
  - istio 模块可能需要清理缓存：`rd /s /q istio\target\`
  - 使用 `-Drat.skip=true` 跳过 Apache RAT 许可证检查以加快构建

### 前端 (console-ui)

```bash
# 安装依赖
npm install

# 启动开发服务器
npm start

# 构建生产版本
npm run build

# 运行 ESLint 检查
npm run eslint

# 自动修复 ESLint 问题
npm run eslint-fix
```
