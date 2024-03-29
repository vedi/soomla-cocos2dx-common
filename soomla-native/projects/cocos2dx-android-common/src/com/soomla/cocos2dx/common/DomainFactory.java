package com.soomla.cocos2dx.common;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author vedi
 *         date 6/9/14
 *         time 6:38 PM
 */
public class DomainFactory {

    public static interface Creator<T> {
        public T create(JSONObject jsonObject);
    }

    public static transient DomainFactory INSTANCE = null;

    private Map<String, Creator<?>> creators = new HashMap<String, Creator<?>>();

    public static DomainFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (DomainFactory.class) {
                if (INSTANCE == null) {
                    INSTANCE = new DomainFactory();
                }
            }
        }
        return INSTANCE;
    }

    public DomainFactory() {

    }

    public void registerCreator(String key, Creator<?> creator) {
        creators.put(key, creator);
    }

    @SuppressWarnings("unchecked")
    public <T>T createWithJsonObject(JSONObject jsonObject) {
        String type = jsonObject.optString(CommonJsonConsts.BP_TYPE, null);
        if (type == null) {
            throw new IllegalArgumentException();
        }

        Creator<T> creator = (Creator<T>) creators.get(type);

        if (creator == null) {
            throw new IllegalArgumentException();
        }

        return creator.create(jsonObject);
    }
}
