namespace QLPCgiangday.GUI
{
    partial class ucKYHOC
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataKH = new DevExpress.XtraGrid.GridControl();
            this.dataKH1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.STT = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAGV = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MACD = new DevExpress.XtraGrid.Columns.GridColumn();
            this.repositoryItemLookUpEdit1 = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            this.MACV = new DevExpress.XtraGrid.Columns.GridColumn();
            this.TENKY = new DevExpress.XtraGrid.Columns.GridColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtTENKY = new DevExpress.XtraEditors.TextEdit();
            this.labelControl7 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl6 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.btnLuu = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoa = new DevExpress.XtraEditors.SimpleButton();
            this.btnSua = new DevExpress.XtraEditors.SimpleButton();
            this.btnThem = new DevExpress.XtraEditors.SimpleButton();
            this.groupControl1 = new DevExpress.XtraEditors.GroupControl();
            this.lbGV = new System.Windows.Forms.Label();
            this.txtTai = new DevExpress.XtraEditors.TextEdit();
            this.labelControl10 = new DevExpress.XtraEditors.LabelControl();
            this.txtHSGT = new DevExpress.XtraEditors.TextEdit();
            this.labelControl9 = new DevExpress.XtraEditors.LabelControl();
            this.txtDMGD = new DevExpress.XtraEditors.TextEdit();
            this.labelControl8 = new DevExpress.XtraEditors.LabelControl();
            this.cbBGV = new System.Windows.Forms.ComboBox();
            this.cbBCD = new System.Windows.Forms.ComboBox();
            this.cbBCV = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataKH)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataKH1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemLookUpEdit1)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTENKY.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.groupControl1)).BeginInit();
            this.groupControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTai.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtHSGT.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtDMGD.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // dataKH
            // 
            this.dataKH.Location = new System.Drawing.Point(92, 216);
            this.dataKH.MainView = this.dataKH1;
            this.dataKH.Name = "dataKH";
            this.dataKH.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.repositoryItemLookUpEdit1});
            this.dataKH.Size = new System.Drawing.Size(521, 327);
            this.dataKH.TabIndex = 0;
            this.dataKH.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.dataKH1});
            this.dataKH.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataKH_KeyDown);
            this.dataKH.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataKH_KeyDown);
            // 
            // dataKH1
            // 
            this.dataKH1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.STT,
            this.MAGV,
            this.MACD,
            this.MACV,
            this.TENKY});
            this.dataKH1.GridControl = this.dataKH;
            this.dataKH1.Name = "dataKH1";
            this.dataKH1.OptionsDetail.DetailMode = DevExpress.XtraGrid.Views.Grid.DetailMode.Default;
            this.dataKH1.OptionsFind.AlwaysVisible = true;
            this.dataKH1.OptionsView.ShowGroupPanel = false;
            this.dataKH1.CustomDrawCell += new DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventHandler(this.dataKH1_CustomDrawCell);
            this.dataKH1.FocusedRowChanged += new DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventHandler(this.dataKH1_FocusedRowChanged);
            // 
            // STT
            // 
            this.STT.Caption = "STT";
            this.STT.Name = "STT";
            this.STT.Visible = true;
            this.STT.VisibleIndex = 0;
            this.STT.Width = 35;
            // 
            // MAGV
            // 
            this.MAGV.Caption = "Giáo viên";
            this.MAGV.FieldName = "MAGV";
            this.MAGV.Name = "MAGV";
            this.MAGV.Visible = true;
            this.MAGV.VisibleIndex = 1;
            this.MAGV.Width = 113;
            // 
            // MACD
            // 
            this.MACD.Caption = "Chức danh";
            this.MACD.ColumnEdit = this.repositoryItemLookUpEdit1;
            this.MACD.FieldName = "MACD";
            this.MACD.Name = "MACD";
            this.MACD.Visible = true;
            this.MACD.VisibleIndex = 2;
            this.MACD.Width = 90;
            // 
            // repositoryItemLookUpEdit1
            // 
            this.repositoryItemLookUpEdit1.AutoHeight = false;
            this.repositoryItemLookUpEdit1.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.repositoryItemLookUpEdit1.Name = "repositoryItemLookUpEdit1";
            // 
            // MACV
            // 
            this.MACV.Caption = "Chức vụ";
            this.MACV.FieldName = "MACV";
            this.MACV.Name = "MACV";
            this.MACV.Visible = true;
            this.MACV.VisibleIndex = 3;
            this.MACV.Width = 111;
            // 
            // TENKY
            // 
            this.TENKY.Caption = "Tên kỳ";
            this.TENKY.FieldName = "TENKY";
            this.TENKY.Name = "TENKY";
            this.TENKY.Visible = true;
            this.TENKY.VisibleIndex = 4;
            this.TENKY.Width = 135;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.cbBCV);
            this.groupBox1.Controls.Add(this.cbBCD);
            this.groupBox1.Controls.Add(this.cbBGV);
            this.groupBox1.Controls.Add(this.txtTENKY);
            this.groupBox1.Controls.Add(this.labelControl7);
            this.groupBox1.Controls.Add(this.labelControl6);
            this.groupBox1.Controls.Add(this.labelControl4);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(92, 11);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1101, 184);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "KỲ HỌC";
            // 
            // txtTENKY
            // 
            this.txtTENKY.Location = new System.Drawing.Point(525, 112);
            this.txtTENKY.Name = "txtTENKY";
            this.txtTENKY.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTENKY.Properties.Appearance.Options.UseFont = true;
            this.txtTENKY.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtTENKY.Size = new System.Drawing.Size(195, 28);
            this.txtTENKY.TabIndex = 4;
            // 
            // labelControl7
            // 
            this.labelControl7.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl7.Location = new System.Drawing.Point(414, 119);
            this.labelControl7.Name = "labelControl7";
            this.labelControl7.Size = new System.Drawing.Size(47, 16);
            this.labelControl7.TabIndex = 12;
            this.labelControl7.Text = "Tên kỳ:";
            // 
            // labelControl6
            // 
            this.labelControl6.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl6.Location = new System.Drawing.Point(757, 56);
            this.labelControl6.Name = "labelControl6";
            this.labelControl6.Size = new System.Drawing.Size(57, 16);
            this.labelControl6.TabIndex = 10;
            this.labelControl6.Text = "Chức vụ:";
            // 
            // labelControl4
            // 
            this.labelControl4.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl4.Location = new System.Drawing.Point(414, 56);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(73, 16);
            this.labelControl4.TabIndex = 6;
            this.labelControl4.Text = "Chức danh:";
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(70, 56);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(63, 16);
            this.labelControl2.TabIndex = 2;
            this.labelControl2.Text = "Giáo viên:";
            // 
            // btnHuy
            // 
            this.btnHuy.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuy.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuy.Location = new System.Drawing.Point(709, 369);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(75, 51);
            this.btnHuy.TabIndex = 35;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnLuu
            // 
            this.btnLuu.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuu.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuu.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuu.Location = new System.Drawing.Point(767, 455);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(75, 51);
            this.btnLuu.TabIndex = 34;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.Click += new System.EventHandler(this.btnLuu_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoa.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoa.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoa.Location = new System.Drawing.Point(650, 455);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(75, 51);
            this.btnXoa.TabIndex = 33;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnSua
            // 
            this.btnSua.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSua.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnSua.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSua.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSua.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSua.Location = new System.Drawing.Point(767, 274);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(75, 51);
            this.btnSua.TabIndex = 32;
            this.btnSua.Text = "Sửa";
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // btnThem
            // 
            this.btnThem.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThem.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThem.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThem.Location = new System.Drawing.Point(650, 274);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 51);
            this.btnThem.TabIndex = 31;
            this.btnThem.Text = "Thêm";
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // groupControl1
            // 
            this.groupControl1.Appearance.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupControl1.Appearance.Options.UseFont = true;
            this.groupControl1.AppearanceCaption.Font = new System.Drawing.Font("Tahoma", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupControl1.AppearanceCaption.Options.UseFont = true;
            this.groupControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.groupControl1.Controls.Add(this.lbGV);
            this.groupControl1.Controls.Add(this.txtTai);
            this.groupControl1.Controls.Add(this.labelControl10);
            this.groupControl1.Controls.Add(this.txtHSGT);
            this.groupControl1.Controls.Add(this.labelControl9);
            this.groupControl1.Controls.Add(this.txtDMGD);
            this.groupControl1.Controls.Add(this.labelControl8);
            this.groupControl1.Location = new System.Drawing.Point(876, 248);
            this.groupControl1.Name = "groupControl1";
            this.groupControl1.Size = new System.Drawing.Size(327, 272);
            this.groupControl1.TabIndex = 36;
            this.groupControl1.Text = "Tải giảng dạy";
            // 
            // lbGV
            // 
            this.lbGV.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.lbGV.AutoSize = true;
            this.lbGV.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbGV.ForeColor = System.Drawing.Color.Red;
            this.lbGV.Location = new System.Drawing.Point(70, 47);
            this.lbGV.Name = "lbGV";
            this.lbGV.Size = new System.Drawing.Size(49, 22);
            this.lbGV.TabIndex = 6;
            this.lbGV.Text = "label";
            // 
            // txtTai
            // 
            this.txtTai.Location = new System.Drawing.Point(215, 186);
            this.txtTai.Name = "txtTai";
            this.txtTai.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTai.Properties.Appearance.Options.UseFont = true;
            this.txtTai.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtTai.Size = new System.Drawing.Size(100, 24);
            this.txtTai.TabIndex = 5;
            // 
            // labelControl10
            // 
            this.labelControl10.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl10.Location = new System.Drawing.Point(43, 190);
            this.labelControl10.Name = "labelControl10";
            this.labelControl10.Size = new System.Drawing.Size(129, 16);
            this.labelControl10.TabIndex = 4;
            this.labelControl10.Text = "Tải giảng dạy (tiết):";
            // 
            // txtHSGT
            // 
            this.txtHSGT.Location = new System.Drawing.Point(215, 133);
            this.txtHSGT.Name = "txtHSGT";
            this.txtHSGT.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtHSGT.Properties.Appearance.Options.UseFont = true;
            this.txtHSGT.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtHSGT.Size = new System.Drawing.Size(100, 24);
            this.txtHSGT.TabIndex = 3;
            // 
            // labelControl9
            // 
            this.labelControl9.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl9.Location = new System.Drawing.Point(43, 137);
            this.labelControl9.Name = "labelControl9";
            this.labelControl9.Size = new System.Drawing.Size(160, 16);
            this.labelControl9.TabIndex = 2;
            this.labelControl9.Text = "Tổng hệ số giảm tải (%):";
            // 
            // txtDMGD
            // 
            this.txtDMGD.Location = new System.Drawing.Point(215, 85);
            this.txtDMGD.Name = "txtDMGD";
            this.txtDMGD.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDMGD.Properties.Appearance.Options.UseFont = true;
            this.txtDMGD.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtDMGD.Size = new System.Drawing.Size(100, 24);
            this.txtDMGD.TabIndex = 1;
            // 
            // labelControl8
            // 
            this.labelControl8.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl8.Location = new System.Drawing.Point(43, 89);
            this.labelControl8.Name = "labelControl8";
            this.labelControl8.Size = new System.Drawing.Size(171, 16);
            this.labelControl8.TabIndex = 0;
            this.labelControl8.Text = "Định mức giảng dạy (tiết):";
            // 
            // cbBGV
            // 
            this.cbBGV.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBGV.FormattingEnabled = true;
            this.cbBGV.Location = new System.Drawing.Point(149, 51);
            this.cbBGV.Name = "cbBGV";
            this.cbBGV.Size = new System.Drawing.Size(174, 27);
            this.cbBGV.TabIndex = 13;
            // 
            // cbBCD
            // 
            this.cbBCD.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBCD.FormattingEnabled = true;
            this.cbBCD.Location = new System.Drawing.Point(525, 51);
            this.cbBCD.Name = "cbBCD";
            this.cbBCD.Size = new System.Drawing.Size(174, 27);
            this.cbBCD.TabIndex = 14;
            // 
            // cbBCV
            // 
            this.cbBCV.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBCV.FormattingEnabled = true;
            this.cbBCV.Location = new System.Drawing.Point(858, 51);
            this.cbBCV.Name = "cbBCV";
            this.cbBCV.Size = new System.Drawing.Size(174, 27);
            this.cbBCV.TabIndex = 15;
            // 
            // ucKYHOC
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.Controls.Add(this.groupControl1);
            this.Controls.Add(this.btnHuy);
            this.Controls.Add(this.btnLuu);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnSua);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dataKH);
            this.Name = "ucKYHOC";
            this.Size = new System.Drawing.Size(1219, 607);
            this.Load += new System.EventHandler(this.ucKYHOC_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataKH)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataKH1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemLookUpEdit1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTENKY.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.groupControl1)).EndInit();
            this.groupControl1.ResumeLayout(false);
            this.groupControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTai.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtHSGT.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtDMGD.Properties)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraGrid.GridControl dataKH;
        private System.Windows.Forms.GroupBox groupBox1;
        private DevExpress.XtraEditors.TextEdit txtTENKY;
        private DevExpress.XtraEditors.LabelControl labelControl7;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraGrid.Views.Grid.GridView dataKH1;
        private DevExpress.XtraGrid.Columns.GridColumn MAGV;
        private DevExpress.XtraGrid.Columns.GridColumn MACD;
        private DevExpress.XtraGrid.Columns.GridColumn MACV;
        private DevExpress.XtraGrid.Columns.GridColumn TENKY;
        private DevExpress.XtraGrid.Columns.GridColumn STT;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEdit1;
        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private DevExpress.XtraEditors.SimpleButton btnLuu;
        private DevExpress.XtraEditors.SimpleButton btnXoa;
        private DevExpress.XtraEditors.SimpleButton btnSua;
        private DevExpress.XtraEditors.SimpleButton btnThem;
        private DevExpress.XtraEditors.GroupControl groupControl1;
        private DevExpress.XtraEditors.TextEdit txtTai;
        private DevExpress.XtraEditors.LabelControl labelControl10;
        private DevExpress.XtraEditors.TextEdit txtHSGT;
        private DevExpress.XtraEditors.LabelControl labelControl9;
        private DevExpress.XtraEditors.TextEdit txtDMGD;
        private DevExpress.XtraEditors.LabelControl labelControl8;
        private System.Windows.Forms.Label lbGV;
        private System.Windows.Forms.ComboBox cbBCV;
        private System.Windows.Forms.ComboBox cbBCD;
        private System.Windows.Forms.ComboBox cbBGV;
    }
}
