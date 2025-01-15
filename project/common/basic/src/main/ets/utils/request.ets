import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { url } from '@kit.ArkTS'
import { data } from '@kit.TelephonyKit'
import { BASE_URL } from '../../../../Index'

const service = axios.create({
  baseURL: BASE_URL,
  timeout: 10000
})

// 请求拦截器
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  return config
}, (error: AxiosError) => {
  return Promise.reject(error)
})

// 响应拦截器
service.interceptors.response.use((response: AxiosResponse) => {
  return response
}, (error: AxiosError) => {
  return Promise.reject(error)
})

// 自定义请求方式
export class Http {
  static get<T>(url: string, params?: object) {
    return service.get<null, T>(url, { params })
  }

  static post<T>(url: string, data?: object) {
    return service.post<null, T>(url, { data })
  }

  static put<T>(url: string, data?: object) {
    return service.put<null, T>(url, data)
  }

  static delete<T>(url: string, data?: object) {
    return service.delete<null, T>(url, data)
  }
}
