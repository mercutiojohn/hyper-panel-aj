<template>
  <div class="text" :style="styleColor">
    <marquee behavior="" :direction="styleColor.direction">{{
      styleColor.text
    }}</marquee>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetMarquee",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {},
      optionsData: {},
      optionsSetup: {},
      flagInter: null,
    };
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options);
    },
    styleColor() {
      return {
        position: this.ispreview ? "absolute" : "static",
        color: this.transStyle.color,
        "font-weight": this.transStyle.fontWeight,
        text:  this.transStyle.joinText === "" ? this.transStyle.text : this.transStyle.text + this.transStyle.joinText,
        "font-size": this.transStyle.fontSize + "px",
        "letter-spacing": this.transStyle.letterSpacing + "em",
        background: this.transStyle.background,
        "text-align": this.transStyle.textAlign,
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px",
        marqueeSet: this.transStyle.marqueeSet,
        styleColor: this.transStyle.marqueeQuit
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
    isBehavior() {
      return this.styleColor.marqueeSet ? "start()" : "stop()";
    }
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
        this.optionsData = val.data;
        this.optionsSetup = val.setup;
        this.setOptionsData();
      },
      deep: true
    }
  },
  mounted() {
    this.options = this.value;
    this.optionsData = this.value.data;
    this.optionsSetup = this.value.setup;
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
    this.setOptionsData();
  },
  methods: {
    // 数据解析
    setOptionsData(e, paramsConfig) {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      // 联动接收者逻辑开始
      optionsData.dynamicData = optionsData.dynamicData || {}; // 兼容 dynamicData undefined
      const myDynamicData = optionsData.dynamicData;
      clearInterval(this.flagInter); // 不管咋，先干掉上一次的定时任务，避免多跑
      if (
        e &&
        optionsData.dataType !== "staticData" &&
        Object.keys(myDynamicData.contextData).length
      ) {
        const keyArr = Object.keys(myDynamicData.contextData);
        paramsConfig.forEach((conf) => {
          if (keyArr.includes(conf.targetKey)) {
            myDynamicData.contextData[conf.targetKey] = e[conf.originKey];
          }
        });
      }
      // 联动接收者逻辑结束
      if (optionsData.dataType === "dynamicData") {
        this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
      } else {};
    },
    dynamicDataFn(val, refreshTime) {
      if (!val) return;
      if (this.ispreview) {
        this.getEchartData(val);
        this.flagInter = setInterval(() => {
          this.getEchartData(val);
        }, refreshTime);
      } else {
        this.getEchartData(val);
      }
    },
    getEchartData(val) {
      const data = this.queryEchartsData(val);
      data.then(res => {
        this.styleColor.text = this.optionsSetup.joinText === "" ? res[0].value : res[0].value + this.optionsSetup.joinText;
        this.$forceUpdate();
      });
    }
  }
};
</script>

<style scoped lang="scss">
.text {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
