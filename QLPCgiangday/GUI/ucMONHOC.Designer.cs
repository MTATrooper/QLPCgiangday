namespace QLPCgiangday.GUI
{
    partial class ucMONHOC
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.btnLuu = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoa = new DevExpress.XtraEditors.SimpleButton();
            this.btnSua = new DevExpress.XtraEditors.SimpleButton();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.txtTEN = new DevExpress.XtraEditors.TextEdit();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.btnThem = new DevExpress.XtraEditors.SimpleButton();
            this.txtMA = new DevExpress.XtraEditors.TextEdit();
            this.gridMH = new DevExpress.XtraGrid.GridControl();
            this.dataMH = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.STT = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAMH = new DevExpress.XtraGrid.Columns.GridColumn();
            this.TENMH = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MABM = new DevExpress.XtraGrid.Columns.GridColumn();
            this.cbBBM = new System.Windows.Forms.ComboBox();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTEN.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMA.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridMH)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataMH)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.cbBBM);
            this.groupBox1.Controls.Add(this.btnHuy);
            this.groupBox1.Controls.Add(this.btnLuu);
            this.groupBox1.Controls.Add(this.btnXoa);
            this.groupBox1.Controls.Add(this.btnSua);
            this.groupBox1.Controls.Add(this.labelControl4);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.Controls.Add(this.txtTEN);
            this.groupBox1.Controls.Add(this.labelControl1);
            this.groupBox1.Controls.Add(this.btnThem);
            this.groupBox1.Controls.Add(this.txtMA);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(86, 58);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(391, 467);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Môn học";
            // 
            // btnHuy
            // 
            this.btnHuy.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuy.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuy.Location = new System.Drawing.Point(216, 359);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(75, 51);
            this.btnHuy.TabIndex = 25;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnLuu
            // 
            this.btnLuu.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuu.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuu.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuu.Location = new System.Drawing.Point(101, 359);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(75, 51);
            this.btnLuu.TabIndex = 24;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.Click += new System.EventHandler(this.btnLuu_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoa.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoa.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoa.Location = new System.Drawing.Point(281, 245);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(75, 51);
            this.btnXoa.TabIndex = 23;
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
            this.btnSua.Location = new System.Drawing.Point(150, 245);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(75, 51);
            this.btnSua.TabIndex = 22;
            this.btnSua.Text = "Sửa";
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // labelControl4
            // 
            this.labelControl4.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl4.Location = new System.Drawing.Point(49, 179);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(56, 19);
            this.labelControl4.TabIndex = 21;
            this.labelControl4.Text = "Bộ môn:";
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(49, 112);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(90, 19);
            this.labelControl2.TabIndex = 17;
            this.labelControl2.Text = "Tên môn học:";
            // 
            // txtTEN
            // 
            this.txtTEN.Location = new System.Drawing.Point(159, 109);
            this.txtTEN.Name = "txtTEN";
            this.txtTEN.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTEN.Properties.Appearance.Options.UseFont = true;
            this.txtTEN.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtTEN.Size = new System.Drawing.Size(186, 28);
            this.txtTEN.TabIndex = 16;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(49, 40);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(88, 19);
            this.labelControl1.TabIndex = 15;
            this.labelControl1.Text = "Mã môn học:";
            // 
            // btnThem
            // 
            this.btnThem.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThem.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThem.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThem.Location = new System.Drawing.Point(33, 245);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 51);
            this.btnThem.TabIndex = 14;
            this.btnThem.Text = "Thêm";
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // txtMA
            // 
            this.txtMA.Location = new System.Drawing.Point(159, 37);
            this.txtMA.Name = "txtMA";
            this.txtMA.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMA.Properties.Appearance.Options.UseFont = true;
            this.txtMA.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.txtMA.Size = new System.Drawing.Size(186, 28);
            this.txtMA.TabIndex = 13;
            // 
            // gridMH
            // 
            this.gridMH.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gridMH.Location = new System.Drawing.Point(548, 71);
            this.gridMH.MainView = this.dataMH;
            this.gridMH.Name = "gridMH";
            this.gridMH.Size = new System.Drawing.Size(596, 454);
            this.gridMH.TabIndex = 3;
            this.gridMH.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.dataMH});
            // 
            // dataMH
            // 
            this.dataMH.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.STT,
            this.MAMH,
            this.TENMH,
            this.MABM});
            this.dataMH.GridControl = this.gridMH;
            this.dataMH.Name = "dataMH";
            this.dataMH.OptionsDetail.DetailMode = DevExpress.XtraGrid.Views.Grid.DetailMode.Default;
            this.dataMH.OptionsFind.AlwaysVisible = true;
            this.dataMH.OptionsView.ShowGroupPanel = false;
            this.dataMH.CustomDrawCell += new DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventHandler(this.dataMH_CustomDrawCell);
            this.dataMH.FocusedRowChanged += new DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventHandler(this.dataMH_FocusedRowChanged);
            this.dataMH.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataMH_KeyDown);
            this.dataMH.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataMH_KeyDown);
            // 
            // STT
            // 
            this.STT.Caption = "STT";
            this.STT.Name = "STT";
            this.STT.Visible = true;
            this.STT.VisibleIndex = 0;
            this.STT.Width = 40;
            // 
            // MAMH
            // 
            this.MAMH.Caption = "Mã môn học";
            this.MAMH.FieldName = "MAMH";
            this.MAMH.Name = "MAMH";
            this.MAMH.Visible = true;
            this.MAMH.VisibleIndex = 1;
            this.MAMH.Width = 80;
            // 
            // TENMH
            // 
            this.TENMH.Caption = "Tên môn học";
            this.TENMH.FieldName = "TENMH";
            this.TENMH.Name = "TENMH";
            this.TENMH.Visible = true;
            this.TENMH.VisibleIndex = 2;
            this.TENMH.Width = 184;
            // 
            // MABM
            // 
            this.MABM.Caption = "Bộ môn";
            this.MABM.FieldName = "MABM";
            this.MABM.Name = "MABM";
            this.MABM.Visible = true;
            this.MABM.VisibleIndex = 3;
            this.MABM.Width = 194;
            // 
            // cbBBM
            // 
            this.cbBBM.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBBM.FormattingEnabled = true;
            this.cbBBM.Location = new System.Drawing.Point(159, 171);
            this.cbBBM.Name = "cbBBM";
            this.cbBBM.Size = new System.Drawing.Size(186, 27);
            this.cbBBM.TabIndex = 26;
            // 
            // ucMONHOC
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.gridMH);
            this.Controls.Add(this.groupBox1);
            this.Name = "ucMONHOC";
            this.Size = new System.Drawing.Size(1165, 608);
            this.Load += new System.EventHandler(this.ucMONHOC_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtTEN.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMA.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridMH)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataMH)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.GroupBox groupBox1;
        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private DevExpress.XtraEditors.SimpleButton btnLuu;
        private DevExpress.XtraEditors.SimpleButton btnXoa;
        private DevExpress.XtraEditors.SimpleButton btnSua;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.TextEdit txtTEN;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnThem;
        private DevExpress.XtraEditors.TextEdit txtMA;
        private DevExpress.XtraGrid.GridControl gridMH;
        private DevExpress.XtraGrid.Views.Grid.GridView dataMH;
        private DevExpress.XtraGrid.Columns.GridColumn STT;
        private DevExpress.XtraGrid.Columns.GridColumn MAMH;
        private DevExpress.XtraGrid.Columns.GridColumn TENMH;
        private DevExpress.XtraGrid.Columns.GridColumn MABM;
        private System.Windows.Forms.ComboBox cbBBM;
    }
}
