package net.jeeshop.core;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * spring mvc 上下文持有者，类似Struts2的ServletActionContext,
 * 
 * @author vincent
 *
 */
@SuppressWarnings("unchecked")
public abstract class SpringMvcContextHolder {

        /**
         * 获取request attribute
         * 
         * @param name 属性名称
         * 
         * @return Object
         */
        public static <O> O getRequestAttribute(String name) {
                return (O) currentRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_REQUEST);
        }

        /**
         * 设置request attribute
         * 
         * @param name 属性名称
         * @param value 值
         */
        public static void setRequestAttribute(String name,Object value) {
                currentRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_REQUEST);
        }

        /**
         * 获取sessiont attribute
         * 
         * @param name 属性名称
         * 
         * @return Object
         */
        public static <O> O getSessionAttribute(String name) {
                return (O) currentRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
        }

        /**
         * 设置session attribute
         * 
         * @param name 属性名称
         * @param value 值
         */
        public static void setSessionAttribute(String name,Object value) {
                currentRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
        }

        /**
         * 获取当前RequestAttributes，该类有很多子类。如果想通过它获取request的话转型成{@link ServletRequestAttributes}.getRequest()即可
         * 
         * @return {@link RequestAttributes}
         */
        public static RequestAttributes currentRequestAttributes() {
                return RequestContextHolder.currentRequestAttributes();
        }
}