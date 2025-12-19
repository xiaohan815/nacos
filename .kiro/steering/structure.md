# 项目结构

项目采用 Maven 多模块结构，包含以下主要模块：

## 核心模块

- **api**：公共 API 定义和 gRPC 服务定义
- **client**：服务发现和配置的客户端 SDK
- **common**：通用工具类和共享代码
- **config**：配置管理模块
- **naming**：服务发现与注册模块
- **core**：核心服务器功能
- **console**：Web 控制台后端
- **console-ui**：Web 控制台前端 React 应用

## 支持模块

- **auth**：认证与授权
- **persistence**：数据持久化层
- **consistency**：分布式一致性（Raft 实现）
- **plugin**：插件接口
- **plugin-default-impl**：默认插件实现
- **sys**：系统管理
- **istio**：Istio 集成
- **prometheus**：Prometheus 指标集成
- **cmdb**：CMDB 集成
- **address**：地址服务器模块

## 测试模块

- **test**：集成测试
  - **config-test**：配置模块集成测试
  - **core-test**：核心模块集成测试
  - **naming-test**：命名模块集成测试
- **example**：示例代码和使用演示

## 前端结构 (console-ui)

```
console-ui/
├── src/
│   ├── components/     # 可复用的 React 组件
│   ├── pages/          # 页面级组件
│   │   ├── AuthorityControl/      # 权限控制
│   │   ├── ClusterManagement/     # 集群管理
│   │   ├── ConfigurationManagement/  # 配置管理
│   │   ├── ServiceManagement/     # 服务管理
│   │   ├── Login/                 # 登录
│   │   └── NameSpace/             # 命名空间
│   ├── reducers/       # Redux reducers
│   ├── layouts/        # 布局组件
│   ├── locales/        # 国际化翻译（中文、英文）
│   └── utils/          # 工具函数
├── build/              # Webpack 构建配置
└── public/             # 静态资源
```

## 后端包结构

所有 Java 包遵循命名模式：`com.alibaba.nacos.<模块>.*`

常见包命名模式：
- `*.api`：公共 API 和接口
- `*.controller`：REST API 控制器
- `*.service`：业务逻辑服务
- `*.model` / `*.entity`：数据模型
- `*.config`：配置类
- `*.utils`：工具类

## 配置文件

- **pom.xml**：Maven 项目配置（根目录和各模块）
- **application.properties**：Spring Boot 应用配置
- **style/**：代码风格和检查配置
  - `nacos-code-style-for-idea.xml`：IntelliJ IDEA 代码风格
  - `NacosCheckStyle.xml`：Checkstyle 规则
