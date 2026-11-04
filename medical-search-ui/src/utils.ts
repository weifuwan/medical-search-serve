// 保存 token 到 localStorage
export const setToken = (token: string) => {
    localStorage.setItem('user_token', token)
}

// 获取 token
export const getToken = () => {
    return localStorage.getItem('user_token') || ''
}

// 保存 autoLogin 到 localStorage
export const setLocalVal = (key: string, val: { [key: string]: any } | string | boolean | number) => {
    localStorage.setItem(key, JSON.stringify(val))
}

// 获取保存数据到 localStorage 的数据
export const getLocalVal = (key: string) => {
    return JSON.parse(localStorage.getItem(key)!)
}

// 保存数据到 sessionStorage
export const setSessionVal = (key: string, val: { [key: string]: any } | string | boolean | number) => {
    sessionStorage.setItem(key, JSON.stringify(val))
}

// 获取保存数据到 sessionStorage 的数据
export const getSessionVal = (key: string) => {
    return JSON.parse(sessionStorage.getItem(key)!)
}

// 权限管理树：根据数据返回符合 tree 的格式数据
export const getPermissonData: any = (data: PERSSIONAPI.PermissionItem[]) => {
    return data.map((item: PERSSIONAPI.PermissionItem) => (
        {
            title: item.name,
            key: item.id,
            children: item.children.length ? getPermissonData(item.children) : item.children
        }
    ))
}

// 导出方法
export const exportFun = (res: any, handleFinsh: Function) => {
    let blob = new Blob([res.data], {
        type: "application/octet-stream",
    })
    let link = document.createElement("a")

    link.href = window.URL.createObjectURL(blob)
    link.download = decodeURI(res.headers['download-filename'])
    link.click()
    //释放内存
    window.URL.revokeObjectURL(link.href)
    handleFinsh()
}

/**
 * 
 * @param arr 原数组
 * @param prop 分组的属性
 * @returns 新数组
 */
export const  groupByMap = (arr: any[], prop: string)=> {
      // 使用对象记录每个属性值的元素
        const grouped:any = {}

        // 先收集所有元素到分组对象中
        arr.forEach((item: any) => {
            const key = item[prop]
            if (!grouped[key]) {
              grouped[key] = []
            }
            grouped[key].push(item)
        })

        // 将所有分组的元素按顺序合并成一个数组
        const result = []
        for (const key in grouped) {
            result.push(...grouped[key])
        }

        return result
    }
