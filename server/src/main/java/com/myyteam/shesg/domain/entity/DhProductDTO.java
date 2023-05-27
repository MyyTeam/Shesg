package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class DhProductDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 产品id
     */
    private String productid;
    /**
     * 敦煌平台的商品ItemCode
     */
    private Long itemcode;
    /**
     * 供应商Id
     */
    private String supplierid;
    /**
     * B端访问标记 1.网红 2.游客
     */
    private Integer accessMark;
    /**
     * 上下架，0下架，1上架 2,删除
     */
    private Integer istate;
    /**
     * {"100007","differ postalcode","签收人和邮编不一致","W","",""};
     * {"100014","quickup","直通车产品","O","",""};
     * {"100018","Counterfeit","未通过- 含违规品牌.","K","",""};
     * {"100019","Attribute Error","属性选择错误","I","",""};
     * {"100012","Brand-2","品牌产品-黄2区","Z","通过审核","Approved"};
     * {"100013","Duplication-name","名称重复","P","此产品重复使用相关产品名称","Name duplicated"};
     * {"100015","Brand-4","品牌产品-黄4区","N","此产品已被品牌权利人投诉","This product has been complained by the copyright holder of the brand"};
     * {"100016","ContactWay","未通过-留联系方式","M","",""};
     * {"100017","Duplication-pic","图片重复","L","此产品重复使用相关产品图片","This product reuses related product pictures"};
     * {"100031","Real MIC","纯绿区产品","","通过审核","Approved"};
     * {"100006","Ban","禁销品","V","此产品为平台禁售产品","This product is a Prohibited Product"};
     * {"100001","Brand-3","品牌产品-黄3区","Q","此产品侵犯知识产权","This product infringes upon intellectual property rights"};
     * {"100002","MIC","MIC产品-绿区","R","通过审核","Approved"};
     * {"100003","Violation","违规品","S","此产品为平台违规产品(违规产品包括：乱放目录，价格违规，留联系方式，抄袭图片，非实物图片等情况。)",
     * {"100004","TOP GMV Counterfeit A","备注A","T","",""};
     * {"100005","TOP GMV Counterfeit B","备注B","U","",""};
     * {"100008","Brand-1","品牌产品-黄1区","","通过审核","Approved"};
     * {"100020","UnSalable","平台禁售产品","J","",""};
     * {"100021","Album Audit","未通过-相册图片未通过审核","","相册图片未通过审核","album pictures not approved"};
     * {"100000","Pending Inspection","未审","X","未审核","pending"};
     * {"100011","whiltlist auto pass","白名单自动通过","Y","",""};
     * {"100022","Infringing products","未通过--侵权产品","","此产品为侵权产品","This product is a infringing products"};
     * {"100023","follow products","关注产品","","关注产品","Follow product"};
     * {"100024","Duplication-attr-and-short-desc","属性与短描重复","","此产品重复使用相关产品的产品属性与短描","This product reuses related product properties and short description"};
     * {"100025","Risk products","风险产品","","通过审核","Approved"};
     * {"100026","White product","白区商品","","通过审核","Approved"};
     * {"100027","Blanck product","黑区商品","","通过审核","Approved"};
     * {"100028","White list","白名单","","通过审核","Approved"};
     * {"200000","pushingaudit","待推送审产品","","因上架数超限进入待推送审核","pending for review because of exceeding product limit"};
     */
    private String counterfeittypeid;
    private Integer vaildday;
    /**
     * 发布类目叶子类目编号
     */
    private String catePubId;
    /**
     * 商品展示类目
     */
    private String cateDispId;
    /**
     * 商品所属商品线Id
     */
    private Integer prodLineId;
    /**
     * 商品名称MD5
     */
    private String namemd5;
    private String imageurl;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date firstimgModifydate;
    private String shippingmodelid;
    private Integer withdrawaltype;
    private String productgroupid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date expireDate;
    private Double marketprice;
    private String sampleitemcode;
    /**
     * 运费方式：0.含免运费，1.不含免运费
     */
    private Integer isfreeship;
    private Integer accuratelyDescribe;
    private Integer issample;
    private String sourcetype;
    private Integer prodtype;
    private Integer syiVersion;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date srhdate;
    private String imgmd5;
    private String operator;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operatedate;
    private String creator;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createddate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deleteon;
    private String deleteby;
    private Integer showStatus;

    private String productUrl;
    /**
     * 搜索推荐类目
     */
    private String srchcatermd;
    /**
     * 是否推送审
     */
    private String isAuditQueue;
    /**
     * 产品标签
     */
    private String productLabel;

    /**
     * 产品基本信息国际化
     **/
    private DhProductBaseDTO productBaseDTO;
    /**
     * 产品库存信息
     */
    private DhProductInventoryDTO productInventoryDTO;

    /**
     * 产品包装信息
     */
    private ProductPackageDTO productPackageDTO;

    /**
     * 产品销售属性设置表（价格体系新增，MYSQL库）
     */
    private ProductSaleSettingDTO productSaleSettingDTO;

    /**
     * 产品图片列表
     */
    private List<ProductAttachDTO> productAttachList;

    /**
     * 属性列表
     */
    private List<ProductAttrDTO> productAttrList;

    /**
     * 商品运费模板
     */
    private List<ProductShippingModelDto> productShippingModelDtoList;
    /**
     * 产品SKU列表  （价格体系新增，MYSQL库）
     */
    private List<ProductSkuDTO> productSkuList;

    /****
     * 尺码模板id
     * */
    private Long sellerSzId;

    /**
     * 商品视频Url
     */
    private List<Video> videoList;

    @Data
    public static class Video {

        /**
         * 视频链接
         */
        private String videoUrl;

        /**
         * 图片类型，默认1:图片，2:高清视频，3:标清视频
         */
        private Integer srcType;
    }
}