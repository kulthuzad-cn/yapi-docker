const yapi2 = require('./yapi.js')
const dbModule2 = require('./utils/db.js')
const userModel2 = require('./models/user.js')
const commons = require('./utils/commons')

yapi2.commons = commons
yapi2.connect = dbModule2.connect()

yapi2.connect.then(() => {
    yapi2.getInst(userModel2).findByEmail(yapi2.WEBCONFIG.adminAccount).then(res => {
	if (res) {
            console.log(`已存在管理员,账号:"${yapi2.WEBCONFIG.adminAccount}",密码请询问数据库管理员`)
            process.exit(0)
        } else {
            require('./install.js')
        }
    }).catch(err => {
        console.error(new Error(err))
    })
}).catch(err => {
    console.log('数据库连接失败')
    console.error(new Error(err))
})
