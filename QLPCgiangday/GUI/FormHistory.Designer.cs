namespace QLPCgiangday.GUI
{
    partial class FormHistory
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.gridHis = new DevExpress.XtraGrid.GridControl();
            this.dataHis = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.MALOP = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAGV1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAGV2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.KIPHOC = new DevExpress.XtraGrid.Columns.GridColumn();
            this.DIADIEM = new DevExpress.XtraGrid.Columns.GridColumn();
            this.SOTIET = new DevExpress.XtraGrid.Columns.GridColumn();
            this.KYHOC = new DevExpress.XtraGrid.Columns.GridColumn();
            this.NAMHOC = new DevExpress.XtraGrid.Columns.GridColumn();
            this.cbBKY = new System.Windows.Forms.ComboBox();
            this.cbBNAM = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.cbBBM = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.gridHis)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataHis)).BeginInit();
            this.SuspendLayout();
            // 
            // gridHis
            // 
            this.gridHis.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.gridHis.Location = new System.Drawing.Point(0, 166);
            this.gridHis.MainView = this.dataHis;
            this.gridHis.Name = "gridHis";
            this.gridHis.Size = new System.Drawing.Size(853, 320);
            this.gridHis.TabIndex = 0;
            this.gridHis.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.dataHis});
            // 
            // dataHis
            // 
            this.dataHis.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.MALOP,
            this.MAGV1,
            this.MAGV2,
            this.KIPHOC,
            this.DIADIEM,
            this.SOTIET,
            this.KYHOC,
            this.NAMHOC});
            this.dataHis.GridControl = this.gridHis;
            this.dataHis.Name = "dataHis";
            this.dataHis.OptionsDetail.DetailMode = DevExpress.XtraGrid.Views.Grid.DetailMode.Default;
            this.dataHis.OptionsFind.AlwaysVisible = true;
            this.dataHis.OptionsView.ShowGroupPanel = false;
            // 
            // MALOP
            // 
            this.MALOP.Caption = "Lớp";
            this.MALOP.FieldName = "MALOP";
            this.MALOP.Name = "MALOP";
            this.MALOP.Visible = true;
            this.MALOP.VisibleIndex = 0;
            // 
            // MAGV1
            // 
            this.MAGV1.Caption = "Giáo viên chính";
            this.MAGV1.FieldName = "MAGV1";
            this.MAGV1.Name = "MAGV1";
            this.MAGV1.Visible = true;
            this.MAGV1.VisibleIndex = 1;
            // 
            // MAGV2
            // 
            this.MAGV2.Caption = "Giáo viên phụ";
            this.MAGV2.FieldName = "MAGV2";
            this.MAGV2.Name = "MAGV2";
            this.MAGV2.Visible = true;
            this.MAGV2.VisibleIndex = 2;
            // 
            // KIPHOC
            // 
            this.KIPHOC.Caption = "Kíp học";
            this.KIPHOC.FieldName = "KIPHOC";
            this.KIPHOC.Name = "KIPHOC";
            this.KIPHOC.Visible = true;
            this.KIPHOC.VisibleIndex = 3;
            // 
            // DIADIEM
            // 
            this.DIADIEM.Caption = "Địa điểm";
            this.DIADIEM.FieldName = "DIADIEM";
            this.DIADIEM.Name = "DIADIEM";
            this.DIADIEM.Visible = true;
            this.DIADIEM.VisibleIndex = 4;
            // 
            // SOTIET
            // 
            this.SOTIET.Caption = "Số tiết";
            this.SOTIET.FieldName = "SOTIET";
            this.SOTIET.Name = "SOTIET";
            this.SOTIET.Visible = true;
            this.SOTIET.VisibleIndex = 5;
            // 
            // KYHOC
            // 
            this.KYHOC.Caption = "Kỳ học";
            this.KYHOC.FieldName = "KYHOC";
            this.KYHOC.Name = "KYHOC";
            this.KYHOC.Visible = true;
            this.KYHOC.VisibleIndex = 6;
            // 
            // NAMHOC
            // 
            this.NAMHOC.Caption = "Năm học";
            this.NAMHOC.FieldName = "NAMHOC";
            this.NAMHOC.Name = "NAMHOC";
            this.NAMHOC.Visible = true;
            this.NAMHOC.VisibleIndex = 7;
            // 
            // cbBKY
            // 
            this.cbBKY.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBKY.FormattingEnabled = true;
            this.cbBKY.Location = new System.Drawing.Point(189, 72);
            this.cbBKY.Name = "cbBKY";
            this.cbBKY.Size = new System.Drawing.Size(121, 27);
            this.cbBKY.TabIndex = 1;
            this.cbBKY.SelectedIndexChanged += new System.EventHandler(this.cbBKY_SelectedIndexChanged);
            // 
            // cbBNAM
            // 
            this.cbBNAM.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBNAM.FormattingEnabled = true;
            this.cbBNAM.Location = new System.Drawing.Point(529, 72);
            this.cbBNAM.Name = "cbBNAM";
            this.cbBNAM.Size = new System.Drawing.Size(191, 27);
            this.cbBNAM.TabIndex = 2;
            this.cbBNAM.SelectedIndexChanged += new System.EventHandler(this.cbBNAM_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(103, 74);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(68, 19);
            this.label1.TabIndex = 3;
            this.label1.Text = "Kỳ học:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(435, 75);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(85, 19);
            this.label2.TabIndex = 4;
            this.label2.Text = "Năm học:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label3.Location = new System.Drawing.Point(163, 22);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(513, 31);
            this.label3.TabIndex = 5;
            this.label3.Text = "DANH SÁCH PHÂN CÔNG GIẢNG DẠY";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(265, 122);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 19);
            this.label4.TabIndex = 7;
            this.label4.Text = "Bộ môn:";
            // 
            // cbBBM
            // 
            this.cbBBM.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBBM.FormattingEnabled = true;
            this.cbBBM.Location = new System.Drawing.Point(359, 119);
            this.cbBBM.Name = "cbBBM";
            this.cbBBM.Size = new System.Drawing.Size(191, 27);
            this.cbBBM.TabIndex = 6;
            this.cbBBM.SelectedIndexChanged += new System.EventHandler(this.cbBBM_SelectedIndexChanged);
            // 
            // FormHistory
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(853, 486);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cbBBM);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbBNAM);
            this.Controls.Add(this.cbBKY);
            this.Controls.Add(this.gridHis);
            this.Name = "FormHistory";
            this.Text = "FormHistory";
            this.Load += new System.EventHandler(this.FormHistory_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridHis)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataHis)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraGrid.GridControl gridHis;
        private DevExpress.XtraGrid.Views.Grid.GridView dataHis;
        private DevExpress.XtraGrid.Columns.GridColumn MALOP;
        private DevExpress.XtraGrid.Columns.GridColumn MAGV1;
        private DevExpress.XtraGrid.Columns.GridColumn MAGV2;
        private DevExpress.XtraGrid.Columns.GridColumn KIPHOC;
        private DevExpress.XtraGrid.Columns.GridColumn DIADIEM;
        private DevExpress.XtraGrid.Columns.GridColumn SOTIET;
        private DevExpress.XtraGrid.Columns.GridColumn KYHOC;
        private DevExpress.XtraGrid.Columns.GridColumn NAMHOC;
        private System.Windows.Forms.ComboBox cbBKY;
        private System.Windows.Forms.ComboBox cbBNAM;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbBBM;
    }
}